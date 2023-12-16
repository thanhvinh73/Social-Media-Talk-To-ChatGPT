import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_with_chatgpt/generated/assets.gen.dart';
import 'package:social_media_with_chatgpt/generated/translations.g.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/models/profile/profile.dart';
import 'package:social_media_with_chatgpt/public_providers/app_user_cubit/app_user_cubit.dart';
import 'package:social_media_with_chatgpt/routes/app_router.dart';
import 'package:social_media_with_chatgpt/screens/account_screen/components/account_container.dart';
import 'package:social_media_with_chatgpt/screens/account_screen/components/account_profile_row_item.dart';
import 'package:social_media_with_chatgpt/screens/account_screen/cubit/account_screent_cubit.dart';
import 'package:social_media_with_chatgpt/screens/home_screen/components/home_post_item.dart';
import 'package:social_media_with_chatgpt/shared/enum/gender.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/extensions/date_ext.dart';
import 'package:social_media_with_chatgpt/shared/extensions/list_ext.dart';
import 'package:social_media_with_chatgpt/shared/helpers/bot_toast_helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dialog_helper.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/utils/image_picker.dart';
import 'package:social_media_with_chatgpt/shared/utils/shared_preference.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_icon_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_network_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_refresh_indicator.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AccountScreentCubit()..getMyPost(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AccountScreentCubit, AccountScreentState>(
            listenWhen: (previous, current) =>
                previous.errorMessage != current.errorMessage &&
                current.errorMessage != null,
            listener: (context, state) {
              showErrorDialog(context, content: state.errorMessage)
                  .then((value) {
                context
                    .read<AccountScreentCubit>()
                    .updateState((p0) => p0.copyWith(errorMessage: null));
              });
            },
          ),
          BlocListener<AccountScreentCubit, AccountScreentState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == ScreenStatus.success) {
                context
                    .read<AppUserCubit>()
                    .updateState((p0) => p0.copyWith(profile: state.profile));
                showSuccessDialog(context,
                        title: tr(LocaleKeys.Profile_UpdateProfile),
                        content:
                            tr(LocaleKeys.Profile_UpdateProfileSuccessfully))
                    .then((value) {
                  context.read<AccountScreentCubit>().updateCurrentProfile(
                      (p0) =>
                          p0.copyWith(avatarFile: null, coverPhotoFile: null));
                  context.read<AccountScreentCubit>().updateState(
                      (p0) => p0.copyWith(status: ScreenStatus.loading));
                });
              }
            },
          ),
          BlocListener<AppUserCubit, AppUserState>(
              listenWhen: (previous, current) =>
                  previous.profile != current.profile &&
                  current.profile != null,
              listener: (context, state) {
                context.read<AccountScreentCubit>().getMyPost();
              }),
        ],
        child: BlocBuilder<AppUserCubit, AppUserState>(
          builder: (context, state) {
            return AppLayout(
              showAppBar: false,
              backgroundColor: AppColors.white,
              useSafeArea: true,
              child: LayoutBuilder(
                builder: (context, constraints) => AppRefreshIndicator(
                  onRefresh: () =>
                      context.read<AccountScreentCubit>().getMyPost(),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              color: Colors.grey,
                              child: AppNetworkImage(
                                url: state.profile?.coverPhoto?.getFileUrl,
                                width: maxWidth,
                                height: maxWidth / 2.3,
                                fit: BoxFit.cover,
                              )),
                          Positioned(
                            bottom: 8 + (maxWidth / 2.3) - 90,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                showImagePickerDialog(
                                    onSelectOption1: () {
                                      ImagePickerUtils.selectPhoto(
                                              context, ImageSource.camera)
                                          .then((value) {
                                        if (value != null) {
                                          context
                                              .read<AccountScreentCubit>()
                                              .updateCurrentProfile((p0) =>
                                                  p0.copyWith(
                                                      coverPhotoFile: value));
                                          context
                                              .read<AccountScreentCubit>()
                                              .updateImage();
                                        }
                                      });
                                    },
                                    onSelectOption2: () {
                                      ImagePickerUtils.selectPhoto(
                                              context, ImageSource.gallery)
                                          .then((value) {
                                        if (value != null) {
                                          context
                                              .read<AccountScreentCubit>()
                                              .updateCurrentProfile((p0) =>
                                                  p0.copyWith(
                                                      coverPhotoFile: value));
                                          context
                                              .read<AccountScreentCubit>()
                                              .updateImage();
                                        }
                                      });
                                    },
                                    option1Label: "Chụp ảnh",
                                    option2Label: "Chọn ảnh từ thư viện");
                              },
                              child: AppContainer(
                                  color: AppColors.background,
                                  padding: const EdgeInsets.all(4),
                                  borderRadius: BorderRadius.circular(100),
                                  child: Icon(Icons.camera_alt,
                                      size: 28, color: AppColors.green)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showImagePickerDialog(
                                  onSelectOption1: () {
                                    ImagePickerUtils.selectPhoto(
                                            context, ImageSource.camera)
                                        .then((value) {
                                      if (value != null) {
                                        context
                                            .read<AccountScreentCubit>()
                                            .updateCurrentProfile((p0) =>
                                                p0.copyWith(avatarFile: value));
                                        context
                                            .read<AccountScreentCubit>()
                                            .updateImage();
                                      }
                                    });
                                  },
                                  onSelectOption2: () {
                                    ImagePickerUtils.selectPhoto(
                                            context, ImageSource.gallery)
                                        .then((value) {
                                      if (value != null) {
                                        context
                                            .read<AccountScreentCubit>()
                                            .updateCurrentProfile((p0) =>
                                                p0.copyWith(avatarFile: value));
                                        context
                                            .read<AccountScreentCubit>()
                                            .updateImage();
                                      }
                                    });
                                  },
                                  option1Label: "Chụp ảnh",
                                  option2Label: "Chọn ảnh từ thư viện");
                            },
                            child: AppContainer(
                                padding: EdgeInsets.fromLTRB(
                                    16, 8 + (maxWidth / 2.3) - 67, 16, 8),
                                child: Stack(
                                  children: [
                                    AppNetworkImage(
                                      url: state.profile?.avatar?.getFileUrl,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            print("check");
                                          },
                                          child: AppContainer(
                                              color: AppColors.background,
                                              padding: const EdgeInsets.all(4),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Icon(Icons.camera_alt,
                                                  size: 28,
                                                  color: AppColors.green)),
                                        ))
                                  ],
                                )),
                          ),
                          Positioned(
                              top: 8,
                              left: 16,
                              child: AppIconButton(
                                  icon: Icons.arrow_back_ios,
                                  color: AppColors.white,
                                  onTap: () {
                                    Get.back();
                                  })),
                        ],
                      ),
                      AppContainer(
                        color: AppColors.background,
                        child: Wrap(
                          runSpacing: 12,
                          children: [
                            AccountContainer(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: Wrap(
                                runSpacing: 16,
                                children: [
                                  AppText(
                                    state.profile.fullname,
                                    fontSize: 25,
                                    color: AppColors.titleText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      sp.clear().then((value) {
                                        Get.toNamed(Routes.login);
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Assets.icons.icLogout.svg(),
                                        AppText("Đăng xuất",
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            AccountContainer(
                                child: Wrap(
                              runSpacing: 8,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      "Hồ sơ",
                                      fontSize: 20,
                                      color: AppColors.titleText,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    AppIconButton(
                                      onTap: () {
                                        Get.toNamed(Routes.updateProfile);
                                      },
                                      icon: Icons.edit,
                                      color: AppColors.darkgreen,
                                    )
                                  ],
                                ),
                                AccountProfileRowItem(
                                  icon: Icons.email,
                                  text: state.profile?.email,
                                ),
                                AccountProfileRowItem(
                                  icon: Icons.phone,
                                  text: state.profile?.phone,
                                ),
                                AccountProfileRowItem(
                                  icon: Icons.cake,
                                  text: state.profile?.dateOfBirth != null
                                      ? DateTime.fromMillisecondsSinceEpoch(
                                              state.profile?.dateOfBirth ?? 0)
                                          .toDayMonthYear
                                      : null,
                                ),
                                AccountProfileRowItem(
                                  icon: state.profile?.gender.icon ??
                                      Icons.person,
                                  text: state.profile?.gender.label,
                                ),
                              ],
                            )),
                            Wrap(runSpacing: 8, children: [
                              BlocSelector<AccountScreentCubit,
                                  AccountScreentState, List<Post>>(
                                selector: (state) => state.myPosts,
                                builder: (context, myPosts) {
                                  return myPosts.isNotNullOrEmpty
                                      ? Wrap(
                                          runSpacing: 12,
                                          children: myPosts
                                              .map((e) => HomePostItem(post: e))
                                              .toList(),
                                        )
                                      : const AccountContainer(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: AppText(
                                                  "Bạn chưa có bài đăng nào!",
                                                  textAlign: TextAlign.center,
                                                  color: AppColors.titleText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                },
                              ),
                            ])
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
