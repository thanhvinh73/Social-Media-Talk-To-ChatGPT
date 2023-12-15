import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/forms/app_text_form_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      onWillPop: true,
      child: AppLayout(
        title: "CẬP NHẬT THÔNG TIN",
        resizeToAvoidBottomInset: true,
        onWillPop: () => Future(() => true),
        useSafeArea: true,
        child: ListView(
          children:[ AppContainer(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextFormField(
                  label: "Họ và tên",
                  isRequired: false,
                  validations: [],
                  validators: [],
                  radius: 4,
                  placeholder: "Insert Ten hien tai",
                  textStyle: TextStyle(color: Colors.white),
                  onchanged: (_){},
                ),
                SizedBox(height: 8),
                AppTextFormField(
                  label: "Gmail",
                  isRequired: false,
                  validations: [],
                  validators: [],
                  radius: 4,
                  placeholder: "Insert Ten hien tai",
                  textStyle: TextStyle(color: Colors.white),
                  onchanged: (_){},
                ),
                SizedBox(height: 8),
                AppTextFormField(
                  label: "Số điện thoại",
                  isRequired: false,
                  validations: [],
                  validators: [],
                  radius: 4,
                  placeholder: "Insert Ten hien tai",
                  textStyle: TextStyle(color: Colors.white),
                  onchanged: (_){},
                ),
                SizedBox(height: 8),
                AppTextFormField(
                  label: "Ngày sinh",
                  isRequired: false,
                  validations: [],
                  validators: [],
                  radius: 4,
                  placeholder: "Insert Ten hien tai",
                  textStyle: TextStyle(color: Colors.white),
                  onchanged: (_){},
                ),
                SizedBox(height: 8),
                AppTextFormField(
                  label: "Giới tính",
                  isRequired: false,
                  validations: [],
                  validators: [],
                  radius: 4,
                  placeholder: "Insert Ten hien tai",
                  textStyle: TextStyle(color: Colors.white),
                  onchanged: (_){},
                ),
                SizedBox(height:8),
                AppTextFormField(
                  label: "Mật khẩu",
                  isRequired: false,
                  validations: [],
                  validators: [],
                  radius: 4,
                  placeholder: "Insert Ten hien tai",
                  textStyle: TextStyle(color: Colors.white),
                  onchanged: (_){},
                ),
                SizedBox(height: 24),
                AppButton(
                    width: MediaQuery.of(context).size.width,
                    title: "Thay đổi thông tin",
                    borderRadius: 4,
                    onPressed: (){})
              ],
            ),
          ),]
        ),
      ),
    );
  }
}
