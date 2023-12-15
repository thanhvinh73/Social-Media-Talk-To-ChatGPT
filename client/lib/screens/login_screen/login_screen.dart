import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:social_media_with_chatgpt/public_providers/app_user_cubit/app_user_cubit.dart';
import 'package:social_media_with_chatgpt/routes/app_router.dart';
import 'package:social_media_with_chatgpt/screens/login_screen/cubit/login_screen_cubit.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dialog_helper.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/utils/validators.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_text.dart';
import 'package:social_media_with_chatgpt/shared/widgets/forms/app_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<LoginScreenCubit, LoginScreenState>(
            listenWhen: (previous, current) =>
                previous.errorMessage != current.errorMessage &&
                current.errorMessage != null,
            listener: (context, state) {
              showErrorDialog(context, content: state.errorMessage)
                  .then((value) {
                context
                    .read<LoginScreenCubit>()
                    .updateState((p0) => p0.copyWith(errorMessage: null));
              });
            },
          ),
          BlocListener<LoginScreenCubit, LoginScreenState>(
            listenWhen: (previous, current) => previous.user != current.user,
            listener: (context, state) {
              if (state.user != null) {
                context.read<AppUserCubit>().updateUser(state.user);
                Get.toNamed(Routes.main);
              }
            },
          ),
        ],
        child: AppDismissKeyboard(
          onWillPop: false,
          child: AppLayout(
            resizeToAvoidBottomInset: false,
            showAppBar: false,
            useSafeArea: true,
            child: LayoutBuilder(
              builder: (context, constraints) => Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child:
                            Image(image: AssetImage("assets/images/logo.png")),
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          child: Wrap(
                            runSpacing: 10,
                            children: [
                              AppText(
                                "Đăng nhập",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                padding: const EdgeInsets.only(bottom: 8),
                              ),
                              AppTextFormField(
                                validations: [Validators.validateEmail],
                                onchanged: (_) {
                                  context.read<LoginScreenCubit>().updateState(
                                      (p0) => p0.copyWith(email: _));
                                },
                                radius: 4,
                                placeholder: "Email",
                              ),
                              AppTextFormField(
                                validations: [Validators.validatePassword],
                                onchanged: (_) {
                                  context.read<LoginScreenCubit>().updateState(
                                      (p0) => p0.copyWith(password: _));
                                },
                                radius: 4,
                                obscureText: true,
                                placeholder: "Mật khẩu",
                              ),
                              AppButton(
                                  title: "Đăng nhập",
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.green,
                                  borderRadius: 4,
                                  onPressed: () {
                                    if (_formKey.currentState != null &&
                                        _formKey.currentState!.validate()) {
                                      context.read<LoginScreenCubit>().login();
                                    }
                                  }),
                              Align(
                                alignment: Alignment.centerRight,
                                child: AppText('Quên mật khẩu?',
                                    textAlign: TextAlign.right),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    label:
                                        AppText('Google', color: Colors.black)),
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
                                Text('Bạn chưa có tài khoản? '),
                                GestureDetector(
                                  onTap: () => Get.toNamed(Routes.register),
                                  child: AppText('Đăng ký',
                                      color: AppColors.darkgreen,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
