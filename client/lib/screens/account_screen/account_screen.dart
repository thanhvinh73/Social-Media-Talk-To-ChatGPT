import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_with_chatgpt/generated/translations.g.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/public_providers/app_user_cubit/app_user_cubit.dart';
import 'package:social_media_with_chatgpt/screens/account_screen/components/account_container.dart';
import 'package:social_media_with_chatgpt/screens/account_screen/components/account_profile_row_item.dart';
import 'package:social_media_with_chatgpt/screens/account_screen/cubit/account_screent_cubit.dart';
import 'package:social_media_with_chatgpt/shared/enum/gender.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/extensions/date_ext.dart';
import 'package:social_media_with_chatgpt/shared/helpers/bot_toast_helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dialog_helper.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/utils/image_picker.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_network_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AccountScreentCubit(),
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
        ],
        child: BlocBuilder<AppUserCubit, AppUserState>(
          builder: (context, state) {
            return AppLayout(
              showAppBar: false,
              backgroundColor: AppColors.white,
              useSafeArea: true,
              child: LayoutBuilder(
                builder: (context, constraints) => ListView(
                  padding: EdgeInsets.zero,
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
                          bottom: 8,
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
                        Positioned(
                            top: (maxWidth / 2.3) - 67,
                            child: InkWell(
                              onTap: () {
                                showImagePickerDialog(
                                    onSelectOption1: () {
                                      ImagePickerUtils.selectPhoto(
                                              context, ImageSource.camera)
                                          .then((value) {
                                        if (value != null) {
                                          context
                                              .read<AccountScreentCubit>()
                                              .updateCurrentProfile((p0) => p0
                                                  .copyWith(avatarFile: value));
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
                                              .updateCurrentProfile((p0) => p0
                                                  .copyWith(avatarFile: value));
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Stack(
                                    children: [
                                      AppNetworkImage(
                                        url: state.profile?.avatar?.getFileUrl,
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: AppContainer(
                                              color: AppColors.background,
                                              padding: const EdgeInsets.all(4),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Icon(Icons.camera_alt,
                                                  size: 28,
                                                  color: AppColors.green)))
                                    ],
                                  )),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 67),
                      child: AppContainer(
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
                                    state.user.fullname,
                                    fontSize: 25,
                                    color: AppColors.titleText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  AppButton(
                                      title: "Cập nhật hồ sơ",
                                      width: maxWidth,
                                      borderRadius: 4,
                                      onPressed: () {}),
                                ],
                              ),
                            ),
                            AccountContainer(
                                child: Wrap(
                              runSpacing: 8,
                              children: [
                                AppText(
                                  "Hồ sơ",
                                  fontSize: 20,
                                  color: AppColors.titleText,
                                  fontWeight: FontWeight.bold,
                                ),
                                AccountProfileRowItem(
                                  icon: Icons.phone,
                                  text: state.profile?.phone,
                                ),
                                AccountProfileRowItem(
                                  icon: Icons.email,
                                  text: state.profile?.email,
                                ),
                                AccountProfileRowItem(
                                  icon: Icons.cake,
                                  text: DateTime.fromMillisecondsSinceEpoch(
                                          state.profile?.dateOfBirth ?? 0)
                                      .toDayMonthYear,
                                ),
                                AccountProfileRowItem(
                                  icon: state.profile?.gender.icon ??
                                      Icons.person,
                                  text: state.profile?.gender.label,
                                )
                              ],
                            )),
                            AccountContainer(
                                child: Wrap(runSpacing: 8, children: [
                              AppText(
                                "Bài đăng",
                                fontSize: 20,
                                color: AppColors.titleText,
                                fontWeight: FontWeight.bold,
                              ),
                              Row()
                            ]))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
