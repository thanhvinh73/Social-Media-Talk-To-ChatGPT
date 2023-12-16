import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/public_providers/app_user_cubit/app_user_cubit.dart';
import 'package:social_media_with_chatgpt/screens/create_post_screen/cubit/create_post_screen_cubit.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/extensions/list_ext.dart';
import 'package:social_media_with_chatgpt/shared/helpers/banner.helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dialog_helper.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/utils/image_picker.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_icon_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_list_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_text_field.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

enum MediaOption { file, camera, video }

extension MediaOptionExt on MediaOption {
  IconData get icon => {
        MediaOption.file: Icons.file_present_rounded,
        MediaOption.camera: Icons.camera_alt,
        MediaOption.video: Icons.video_call_rounded,
      }[this]!;

  String get label => {
        MediaOption.file: "Tệp",
        MediaOption.camera: "Ảnh",
        MediaOption.video: "Video",
      }[this]!;

  VoidCallback onTap(BuildContext context) => {
        MediaOption.file: () {
          ImagePickerUtils.selectMultiPhoto().then((values) {
            if (values.isNotNullOrEmpty) {
              List<File> newList = [];
              values.forEach((element) {
                if (element != null) {
                  newList.add(element);
                }
              });
              context.read<CreatePostScreenCubit>().updateCurrentPost(
                  (p0) => p0.copyWith(imageFile: newList, images: []));
            }
          });
        },
        MediaOption.camera: () {
          ImagePickerUtils.selectPhoto(context, ImageSource.camera)
              .then((value) {
            if (value != null) {
              context.read<CreatePostScreenCubit>().updateCurrentPost(
                  (p0) => p0.copyWith(imageFile: [value], images: []));
            }
          });
        },
        MediaOption.video: () {
          // ImagePickerUtils.selectVideo(context, ImageSource.camera)
          //     .then((value) {
          //   if (value != null) {
          //     context
          //         .read<CreatePostScreenCubit>()
          //         .updateCurrentPost((p0) => p0.copyWith(imageFile: [value]));
          //   }
          // });
        },
      }[this]!;
}

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key, this.post});
  final Post? post;

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      onWillPop: true,
      child: BlocProvider(
        create: (context) => CreatePostScreenCubit(post),
        child: MultiBlocListener(
          listeners: [
            BlocListener<CreatePostScreenCubit, CreatePostScreenState>(
              listenWhen: (previous, current) =>
                  previous.errorMessage != current.errorMessage &&
                  current.errorMessage != null,
              listener: (context, state) {
                showErrorDialog(context, content: state.errorMessage)
                    .then((value) {
                  context
                      .read<CreatePostScreenCubit>()
                      .updateState((p0) => p0.copyWith(errorMessage: null));
                });
              },
            ),
            BlocListener<CreatePostScreenCubit, CreatePostScreenState>(
                listenWhen: (previous, current) =>
                    previous.status != current.status,
                listener: (context, state) {
                  if (state.status == ScreenStatus.success) {
                    Get.back(result: state.currentPost);
                    showSuccessBanner(
                        content: post != null
                            ? "Cập nhật bài đăng thành công!"
                            : "Tạo bài đăng thành công!",
                        delayDurationInMilliseconds: 100);
                  }
                }),
          ],
          child: BlocSelector<AppUserCubit, AppUserState, User?>(
            selector: (state) => state.user,
            builder: (context, user) {
              return BlocBuilder<CreatePostScreenCubit, CreatePostScreenState>(
                builder: (context, state) {
                  return AppLayout(
                    onWillPop: () => Future.value(true),
                    title: "Bài Đăng",
                    useSafeArea: true,
                    action: [
                      AppIconButton(
                          padding: const EdgeInsets.only(right: 16),
                          onTap: () {
                            post != null
                                ? context
                                    .read<CreatePostScreenCubit>()
                                    .updatePost()
                                : context
                                    .read<CreatePostScreenCubit>()
                                    .createPost();
                          },
                          icon: Icons.done),
                    ],
                    child: LayoutBuilder(
                      builder: (context, constraints) => SingleChildScrollView(
                        child: AppContainer(
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                runSpacing: 16,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppImage(
                                        height: 60,
                                        width: 60,
                                        borderRadius: BorderRadius.circular(50),
                                        url: user?.avatar.getFileUrl,
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            user.fullname,
                                            color: AppColors.titleText,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                          ),
                                          if (post == null)
                                            Wrap(
                                              spacing: 10,
                                              children: MediaOption.values
                                                  .map((e) => GestureDetector(
                                                        onTap: e.onTap(context),
                                                        child: AppContainer(
                                                          color: AppColors
                                                              .lightGreen,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(e.icon,
                                                                  color: AppColors
                                                                      .titleText),
                                                              const SizedBox(
                                                                  width: 8),
                                                              AppText(e.label,
                                                                  color: AppColors
                                                                      .titleText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                            ],
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                            )
                                        ],
                                      )
                                    ],
                                  ),
                                  BlocSelector<CreatePostScreenCubit,
                                      CreatePostScreenState, List<FileModel>>(
                                    selector: (state) =>
                                        state.currentPost?.images ?? [],
                                    builder: (context, images) {
                                      return images.isNotNullOrEmpty
                                          ? AppListImage(
                                              imgsUrl: images
                                                  .map((e) => e.getFileUrl)
                                                  .toList(),
                                              amountOfImageShow: 6)
                                          : const SizedBox.shrink();
                                    },
                                  ),
                                  BlocSelector<CreatePostScreenCubit,
                                      CreatePostScreenState, List<File>>(
                                    selector: (state) =>
                                        state.currentPost?.imageFile ?? [],
                                    builder: (context, imageFile) {
                                      return imageFile.isNotNullOrEmpty
                                          ? Row(
                                              children: [
                                                Expanded(
                                                  child: AppText(
                                                    "Bạn đã đính kèm ${imageFile.length} tệp",
                                                    color: AppColors.darkgreen,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox.shrink();
                                    },
                                  ),
                                  Row(
                                    children: [
                                      AppText("Tiêu đề",
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic),
                                    ],
                                  ),
                                  AppTextField(
                                      focusBorderColor: AppColors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                      initValue: state.currentPost?.title,
                                      placeholder:
                                          "Nhập tiêu đề của bạn tại đây...",
                                      maxLines: 2,
                                      onChanged: (_) {
                                        context
                                            .read<CreatePostScreenCubit>()
                                            .updateCurrentPost(
                                                (p0) => p0.copyWith(title: _));
                                      }),
                                  AppText("Mô tả",
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                  AppTextField(
                                      focusBorderColor: AppColors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                      initValue: state.currentPost?.description,
                                      placeholder:
                                          "Nhập miêu tả bài đăng của bạn tại đây...",
                                      textInputType: TextInputType.multiline,
                                      maxLines: 8,
                                      onChanged: (_) {
                                        context
                                            .read<CreatePostScreenCubit>()
                                            .updateCurrentPost((p0) =>
                                                p0.copyWith(description: _));
                                      }),
                                ],
                              ),
                              if (post != null)
                                AppButton(
                                    title: "Xóa bài đăng",
                                    width: MediaQuery.of(context).size.width,
                                    color: AppColors.background,
                                    borderColor: AppColors.red,
                                    titleColor: AppColors.red,
                                    onPressed: () {
                                      showConfirmDialog(context,
                                          title: "Xóa bài đăng",
                                          content:
                                              "Bạn có chắc chắn muốn xóa bài đăng này!",
                                          onAccept: () {
                                        context
                                            .read<CreatePostScreenCubit>()
                                            .deleteCurrentPost()
                                            .then((value) {
                                          Get.back(result: true);
                                          showSuccessBanner(
                                              content:
                                                  "Xóa bài viết thành công",
                                              delayDurationInMilliseconds: 100);
                                        });
                                      });
                                    })
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
