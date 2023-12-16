import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:social_media_with_chatgpt/public_providers/app_user_cubit/app_user_cubit.dart';
import 'package:social_media_with_chatgpt/screens/update_profile_screen/cubit/update_profile_screen_cubit.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';
import 'package:social_media_with_chatgpt/shared/enum/gender.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/helpers/banner.helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dialog_helper.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/utils/date_util.dart';
import 'package:social_media_with_chatgpt/shared/utils/validators.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_date_picker.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dropdown_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_text.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/forms/app_text_form_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      onWillPop: true,
      child: BlocProvider(
        create: (context) => UpdateProfileScreenCubit(),
        child: MultiBlocListener(
          listeners: [
            BlocListener<UpdateProfileScreenCubit, UpdateProfileScreenState>(
              listenWhen: (previous, current) =>
                  previous.errorMessage != current.errorMessage &&
                  current.errorMessage != null,
              listener: (context, state) {
                showErrorDialog(context, content: state.errorMessage)
                    .then((value) {
                  context
                      .read<UpdateProfileScreenCubit>()
                      .updateState((p0) => p0.copyWith(errorMessage: null));
                });
              },
            ),
            BlocListener<UpdateProfileScreenCubit, UpdateProfileScreenState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                if (state.status == ScreenStatus.success) {
                  context.read<AppUserCubit>().updateState(
                      (p0) => p0.copyWith(profile: state.currentProfile));
                  PublicApi.apis.getUser().then((res) {
                    if (res.data != null)
                      context
                          .read<AppUserCubit>()
                          .updateState((p0) => p0.copyWith(user: res.data));
                    Get.back();
                    showSuccessBanner(
                        content: "Cập nhật hồ sơ thành công!",
                        delayDurationInMilliseconds: 100);
                  });
                }
              },
            ),
          ],
          child: BlocBuilder<AppUserCubit, AppUserState>(
            builder: (context, state) {
              context.read<UpdateProfileScreenCubit>().updateState(
                  (p0) => p0.copyWith(currentProfile: state.profile));
              return AppLayout(
                title: "CẬP NHẬT THÔNG TIN",
                resizeToAvoidBottomInset: true,
                onWillPop: () => Future(() => true),
                useSafeArea: true,
                child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    child: AppContainer(
                      padding: EdgeInsets.all(16),
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Form(
                        key: _formKey,
                        child: BlocBuilder<UpdateProfileScreenCubit,
                            UpdateProfileScreenState>(
                          builder: (context, state) {
                            final profile = state.currentProfile;
                            return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    runSpacing: 12,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    40) *
                                                0.5,
                                            child: AppTextFormField(
                                                label: "Họ",
                                                validations: [
                                                  Validators.validateNotEmpty
                                                ],
                                                initValue: profile?.firstname,
                                                radius: 4,
                                                isRequired: false,
                                                placeholder: "Nhập họ",
                                                onchanged: (_) {
                                                  context
                                                      .read<
                                                          UpdateProfileScreenCubit>()
                                                      .updateCurrentProfile(
                                                          (p0) => p0.copyWith(
                                                              firstname: _));
                                                }),
                                          ),
                                          SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    40) *
                                                0.5,
                                            child: AppTextFormField(
                                                validations: [
                                                  Validators.validateNotEmpty
                                                ],
                                                radius: 4,
                                                initValue: profile?.lastname,
                                                label: "Tên",
                                                isRequired: false,
                                                placeholder: "Nhập tên",
                                                onchanged: (_) {
                                                  context
                                                      .read<
                                                          UpdateProfileScreenCubit>()
                                                      .updateCurrentProfile(
                                                          (p0) => p0.copyWith(
                                                              lastname: _));
                                                }),
                                          ),
                                        ],
                                      ),
                                      AppTextFormField(
                                        label: "Số điện thoại",
                                        isRequired: false,
                                        initValue: profile?.phone,
                                        validations: [
                                          Validators.validateNotEmpty
                                        ],
                                        textInputType: TextInputType.phone,
                                        radius: 4,
                                        placeholder: "Nhập số điện thoại",
                                        onchanged: (_) {
                                          context
                                              .read<UpdateProfileScreenCubit>()
                                              .updateCurrentProfile((p0) =>
                                                  p0.copyWith(phone: _));
                                        },
                                      ),
                                      BlocBuilder<UpdateProfileScreenCubit,
                                          UpdateProfileScreenState>(
                                        buildWhen: (previous, current) =>
                                            previous.invalidGender !=
                                                current.invalidGender ||
                                            previous.currentProfile !=
                                                current.currentProfile,
                                        builder: (context, state) {
                                          return AppDatePicker(
                                              label: "Ngày sinh",
                                              placeholder: "Chọn ngày sinh",
                                              isRequired: false,
                                              errorLabel: state.invalidDob,
                                              initialDate: profile
                                                          ?.dateOfBirth !=
                                                      null
                                                  ? DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          profile!.dateOfBirth!)
                                                  : null,
                                              radius: 4,
                                              onChanged: (_) {
                                                context
                                                    .read<
                                                        UpdateProfileScreenCubit>()
                                                    .updateCurrentProfile(
                                                        (p0) => p0.copyWith(
                                                            dateOfBirth: DateTimeUtils
                                                                .convertToMilliseconds(
                                                                    "dd/MM/yyyy",
                                                                    _)));
                                              });
                                        },
                                      ),
                                      BlocBuilder<UpdateProfileScreenCubit,
                                          UpdateProfileScreenState>(
                                        buildWhen: (previous, current) =>
                                            previous.invalidGender !=
                                                current.invalidGender ||
                                            previous.currentProfile !=
                                                current.currentProfile,
                                        builder: (context, state) {
                                          return AppDropdownButton<Gender>(
                                            isRequired: false,
                                            label: "Giới tính",
                                            icon: Icon(
                                              Icons.arrow_drop_down_outlined,
                                              color: AppColors.darkgreen,
                                              size: 33,
                                            ),
                                            borderColor: AppColors.grey,
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 16,
                                                    top: 2,
                                                    bottom: 2,
                                                    right: 12),
                                            errorLabel: state.invalidGender,
                                            placeholder: "Chọn giới tính",
                                            onChanged: (gender) {
                                              context
                                                  .read<
                                                      UpdateProfileScreenCubit>()
                                                  .updateCurrentProfile((p0) =>
                                                      p0.copyWith(
                                                          gender: gender));
                                            },
                                            value: state.currentProfile?.gender,
                                            listItems: [
                                              const DropdownMenuItem<Gender>(
                                                enabled: false,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 8),
                                                  child: AppText(
                                                    'Chọn giới tính',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        AppColors.hintTextColor,
                                                  ),
                                                ),
                                              ),
                                              ...Gender.values
                                                  .map((e) => DropdownMenuItem<
                                                          Gender>(
                                                      value: e,
                                                      child: AppText(
                                                        e.label,
                                                        fontSize: 16,
                                                        fontWeight: state
                                                                    .currentProfile
                                                                    ?.gender ==
                                                                e
                                                            ? FontWeight.w600
                                                            : FontWeight.w400,
                                                        color: state.currentProfile
                                                                    ?.gender ==
                                                                e
                                                            ? AppColors.green
                                                            : AppColors.black,
                                                      )))
                                                  .toList(),
                                            ],
                                            selectedItemBuilder: (context) => [
                                              SizedBox.shrink(),
                                              ...Gender.values
                                                  .map((e) => Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: AppText(
                                                          e.label,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .titleText,
                                                        ),
                                                      ))
                                                  .toList(),
                                            ],
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  AppButton(
                                      width: MediaQuery.of(context).size.width,
                                      title: "Thay đổi thông tin",
                                      borderRadius: 4,
                                      onPressed: () {
                                        if (_formKey.currentState != null &&
                                            _formKey.currentState!.validate()) {
                                          context
                                              .read<UpdateProfileScreenCubit>()
                                              .updateProfile();
                                        }
                                      })
                                ]);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
