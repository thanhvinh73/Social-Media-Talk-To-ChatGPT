import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';

import '../../generated/assets.gen.dart';
import '../utils/app_colors.dart';
import 'app_text_field.dart';

class AppTimePicker extends StatefulWidget {
  final String? label;
  final double? width;
  final double? height;
  final String? errorLabel;
  final EdgeInsets padding;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? focusBorderColor;
  final double radius;
  final bool isRequired;
  final String? placeholder;
  final Color primaryDialogColor;
  final String? value;
  final bool readOnly;
  final void Function(String) onChanged;
  final EdgeInsets? contentPadding;
  final TimeOfDay? initialTime;
  const AppTimePicker(
      {super.key,
      this.label,
      this.width,
      this.height,
      this.errorLabel,
      this.padding = EdgeInsets.zero,
      this.fontSize = 16,
      this.backgroundColor,
      this.focusBorderColor,
      this.radius = 4,
      this.isRequired = true,
      this.placeholder,
      this.primaryDialogColor = AppColors.orange,
      this.value,
      this.readOnly = false,
      required this.onChanged,
      this.contentPadding,
      this.initialTime});

  @override
  State<AppTimePicker> createState() => _AppTimePickerState();
}

class _AppTimePickerState extends State<AppTimePicker> {
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
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AppTextField(
          label: widget.label,
          backgroundColor: widget.backgroundColor,
          errorLabel: widget.errorLabel,
          isRequired: widget.isRequired,
          focusBorderColor: widget.focusBorderColor,
          padding: widget.padding,
          placeholder: widget.placeholder ?? "Chọn thời gian",
          radius: widget.radius,
          showCursor: false,
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
              child: Assets.icons.icAlarm.svg(color: AppColors.orange)),
          onChanged: (_) {},
          onTap: () async {
            if (!widget.readOnly) {
              showTimePicker(
                context: context,
                initialTime: widget.initialTime ?? TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.inputOnly,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                          primary: widget.primaryDialogColor,
                          onPrimary: AppColors.white,
                          onSurface: AppColors.black,
                        )),
                        child: child!),
                  );
                },
              ).then((timeOfDay) {
                if (timeOfDay != null) {
                  _textController.text = timeOfDay.format(context);
                }
              });
            }
          }),
    );
  }
}
