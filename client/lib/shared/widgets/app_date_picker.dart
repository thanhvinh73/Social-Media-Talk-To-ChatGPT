import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/utils/date_util.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_text_field.dart';

import '../../generated/assets.gen.dart';

class AppDatePicker extends StatefulWidget {
  final String? label;
  final String? errorLabel;
  final EdgeInsets padding;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? focusBorderColor;
  final double radius;
  final bool isRequired;
  final String? placeholder;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Color primaryDialogColor;
  final String? value;
  final bool readOnly;
  final void Function(String) onChanged;
  final EdgeInsets? contentPadding;
  const AppDatePicker(
      {super.key,
      this.label,
      this.errorLabel,
      this.padding = EdgeInsets.zero,
      this.fontSize = 16,
      this.backgroundColor,
      this.focusBorderColor,
      this.radius = 4,
      this.isRequired = true,
      this.placeholder,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.primaryDialogColor = AppColors.darkgreen,
      this.value,
      this.readOnly = false,
      required this.onChanged,
      this.contentPadding});

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.value);
    _textController.addListener(() {
      if (_textController.text.isNotEmptyOrNull) {
        widget.onChanged.call(_textController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
        label: widget.label,
        backgroundColor: widget.backgroundColor,
        errorLabel: widget.errorLabel,
        isRequired: widget.isRequired,
        focusBorderColor: widget.focusBorderColor,
        padding: widget.padding,
        placeholder: widget.placeholder ?? "Chọn ngày, tháng, năm",
        radius: widget.radius,
        showCursor: false,
        initValue: widget.initialDate != null
            ? DateTimeUtils.convertToString(
                "dd/MM/yyyy", widget.initialDate!.millisecondsSinceEpoch)
            : null,
        readOnly: true,
        maxLines: 1,
        minLines: 1,
        contentPadding: widget.contentPadding,
        controller: _textController,
        obscureText: false,
        suffixIcon: Container(
            color: AppColors.transparent,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(right: 8),
            child: Assets.icons.icCalendar.svg(color: AppColors.darkgreen)),
        onChanged: (_) {},
        onTap: () async {
          if (!widget.readOnly) {
            final firstDate = widget.firstDate ?? DateTime(1970);
            final initialDate = widget.initialDate ?? DateTime.now();
            final datetime = await showDatePicker(
                context: context,
                initialDate: initialDate.isBefore(firstDate)
                    ? DateTime.now()
                    : initialDate,
                fieldLabelText: widget.label,
                initialDatePickerMode: DatePickerMode.day,
                keyboardType: TextInputType.datetime,
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                      primary: widget.primaryDialogColor,
                      onPrimary: AppColors.white,
                      onSurface: AppColors.black,
                    )),
                    child: Container(
                      child: child,
                    ),
                  );
                },
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                firstDate: firstDate,
                lastDate: widget.lastDate ??
                    DateTime.now().add(const Duration(days: 365)));
            if (datetime != null) {
              _textController.text = DateFormat("dd/MM/yyyy").format(datetime);
            }
          }
        });
  }
}
