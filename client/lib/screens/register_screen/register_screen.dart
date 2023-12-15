import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:social_media_with_chatgpt/generated/assets.gen.dart';
import 'package:social_media_with_chatgpt/generated/translations.g.dart';
import 'package:social_media_with_chatgpt/routes/app_router.dart';
import 'package:social_media_with_chatgpt/screens/register_screen/cubit/register_screen_cubit.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dialog_helper.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/utils/validators.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_text.dart';
import 'package:social_media_with_chatgpt/shared/widgets/forms/app_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      onWillPop: false,
      child: BlocProvider(
        create: (context) => RegisterScreenCubit(),
        child: MultiBlocListener(
          listeners: [
            BlocListener<RegisterScreenCubit, RegisterScreenState>(
              listenWhen: (previous, current) =>
                  previous.errorMessage != current.errorMessage &&
                  current.errorMessage != null,
              listener: (context, state) {
                showErrorDialog(context, content: state.errorMessage)
                    .then((value) {
                  context
                      .read<RegisterScreenCubit>()
                      .updateState((p0) => p0.copyWith(errorMessage: null));
                });
              },
            ),
            BlocListener<RegisterScreenCubit, RegisterScreenState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                if (state.status == ScreenStatus.success) {
                  showSuccessDialog(
                    context,
                    title: tr(LocaleKeys.App_Success),
                    content: tr(LocaleKeys.Auth_RegisterSuccessfully),
                  ).then((value) {
                    Get.toNamed(Routes.login);
                  });
                }
              },
            ),
          ],
          child: AppLayout(
            resizeToAvoidBottomInset: true,
            showAppBar: false,
            useSafeArea: true,
            child: BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
              builder: (context, state) {
                return LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    child: AppContainer(
                      padding: const EdgeInsets.all(16),
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              runSpacing: 16,
                              children: [
                                Align(
                                    child:
                                        Assets.images.logo.image(height: 135)),
                                Wrap(
                                  runSpacing: 10,
                                  children: [
                                    AppText(
                                      "Đăng ký",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      padding: const EdgeInsets.only(bottom: 8),
                                    ),
                                    AppTextFormField(
                                        validations: [Validators.validateEmail],
                                        radius: 4,
                                        placeholder: "Email",
                                        onchanged: (_) {
                                          context
                                              .read<RegisterScreenCubit>()
                                              .updateCurrentUser((p0) =>
                                                  p0.copyWith(email: _));
                                        }),
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
                                              validations: [
                                                Validators.validateNotEmpty
                                              ],
                                              radius: 4,
                                              placeholder: "Họ",
                                              onchanged: (_) {
                                                context
                                                    .read<RegisterScreenCubit>()
                                                    .updateCurrentUser((p0) =>
                                                        p0.copyWith(
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
                                              placeholder: "Tên",
                                              onchanged: (_) {
                                                context
                                                    .read<RegisterScreenCubit>()
                                                    .updateCurrentUser((p0) =>
                                                        p0.copyWith(
                                                            lastname: _));
                                              }),
                                        ),
                                      ],
                                    ),
                                    AppTextFormField(
                                        validations: [
                                          Validators.validatePassword
                                        ],
                                        radius: 4,
                                        placeholder: "Mật khẩu",
                                        onchanged: (_) {
                                          context
                                              .read<RegisterScreenCubit>()
                                              .updateCurrentUser((p0) =>
                                                  p0.copyWith(password: _));
                                        }),
                                    AppTextFormField(
                                        validations: [
                                          (data) => Validators
                                              .validateConfirmPassword(
                                                  state.currentUser?.password,
                                                  data)
                                        ],
                                        radius: 4,
                                        placeholder: "Xác nhận mật khẩu",
                                        onchanged: (_) {
                                          context
                                              .read<RegisterScreenCubit>()
                                              .updateCurrentUser((p0) =>
                                                  p0.copyWith(
                                                      confirmPassword: _));
                                        }),
                                    AppButton(
                                        title: "Đăng ký",
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.green,
                                        borderRadius: 4,
                                        onPressed: () {
                                          if (_formKey.currentState != null &&
                                              _formKey.currentState!
                                                  .validate()) {
                                            context
                                                .read<RegisterScreenCubit>()
                                                .register();
                                          }
                                        }),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Divider(
                                            color: Colors.black, thickness: 1)),
                                    SizedBox(width: 7),
                                    AppText("Đăng nhập với"),
                                    SizedBox(width: 7),
                                    Expanded(
                                        child: Divider(
                                            color: Colors.black, thickness: 1)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton.icon(
                                        onPressed: () => {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.white)),
                                        icon: Image(
                                            width: 30,
                                            height: 30,
                                            image: AssetImage(
                                                'assets/images/google.png')),
                                        label: AppText('Google',
                                            color: Colors.black)),
                                    ElevatedButton.icon(
                                        onPressed: () => {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.white)),
                                        icon: Image(
                                            width: 30,
                                            height: 30,
                                            image: AssetImage(
                                                'assets/images/microsoft.png')),
                                        label: AppText('Microsoft',
                                            color: Colors.black)),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Bạn đã có tài khoản? '),
                                    GestureDetector(
                                      onTap: () => Get.toNamed(Routes.login),
                                      child: AppText('Đăng nhập',
                                          color: AppColors.darkgreen,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
