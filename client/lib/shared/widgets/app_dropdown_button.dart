import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';

import '../../generated/assets.gen.dart';
import '../utils/app_colors.dart';
import 'app_text.dart';

class AppDropdownButton<T> extends StatelessWidget {
  final void Function(T?)? onChanged;
  final T? value;
  final List<DropdownMenuItem<T>>? listItems;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final String? label;
  final String? errorLabel;
  final String? placeholder;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final Widget? icon;
  final bool? isExpanded;
  final double radius;
  final bool isRequired;
  final Color? borderColor;
  final double? placeholderSize;

  const AppDropdownButton(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.listItems,
      required this.selectedItemBuilder,
      this.label,
      this.errorLabel,
      this.placeholder,
      this.padding,
      this.margin,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      this.icon,
      this.isExpanded = true,
      this.radius = 4,
      this.isRequired = true,
      this.borderColor,
      this.placeholderSize = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmptyOrNull)
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: label,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.titleText,
                      )),
              if (isRequired)
                const TextSpan(
                    text: ' *',
                    style: TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
            ])),
          if (label.isNotEmptyOrNull) const SizedBox(height: 8),
          Container(
            padding: contentPadding,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                  color: errorLabel != null
                      ? AppColors.red
                      : (borderColor != null)
                          ? borderColor!
                          : AppColors.basicGrey,
                  width: 1),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                icon: icon ??
                    const Icon(Icons.arrow_drop_down,
                        size: 35, color: AppColors.orange),
                value: value,
                onChanged: onChanged,
                hint: AppText(placeholder ?? "",
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintTextColor,
                    fontSize: placeholderSize!),
                items: listItems,
                elevation: 2,
                isExpanded: isExpanded!,
                selectedItemBuilder: selectedItemBuilder,
                dropdownColor: AppColors.white,
              ),
            ),
          ),
          if (errorLabel != null) const SizedBox(height: 8),
          if (errorLabel != null)
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Assets.icons.icErrorWarningFill
                          .svg(width: 16, height: 16, color: Colors.red),
                    ),
                  ),
                  TextSpan(
                    text: tr(errorLabel!),
                    style: GoogleFonts.notoSans(
                        color: AppColors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
