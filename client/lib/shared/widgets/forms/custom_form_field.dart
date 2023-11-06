import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';

import '../../../generated/assets.gen.dart';
import '../../utils/app_colors.dart';
import 'app_text_form_field.dart';

class CustomFormFile<T> extends FormField<T> {
  final List<TypeValidation<T>> validations;
  final T? initialValue;
  final Widget Function(FormFieldState<T>) widgetBuilder;
  final Widget Function(String)? errorBuilder;

  CustomFormFile(
      {super.key,
      required this.validations,
      required this.widgetBuilder,
      this.initialValue,
      this.errorBuilder})
      : super(
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (currentData) {
              return validations
                  .map((validateFunc) => validateFunc(currentData))
                  .firstWhere((element) => element.isNotEmptyOrNull,
                      orElse: () => null);
            },
            builder: (validator) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widgetBuilder(validator),
                  if (!validator.isValid &&
                      validator.errorText.isNotEmptyOrNull)
                    errorBuilder?.call(validator.errorText!) ??
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                    child: Assets.icons.icErrorWarningFill.svg(
                                        width: 16,
                                        height: 16,
                                        color: Colors.red),
                                  ),
                                ),
                                TextSpan(
                                  text: validator.errorText!,
                                  style: const TextStyle(
                                      color: AppColors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        )
                ],
              );
            });
}
