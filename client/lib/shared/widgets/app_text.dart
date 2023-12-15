import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppText extends StatelessWidget {
  AppText(
    this.text, {
    super.key,
    this.color = AppColors.titleText,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.maxLines,
    this.textOverflow,
    this.textAlign,
    this.decoration,
    this.fontFamily,
    this.fontStyle,
    this.padding = EdgeInsets.zero,
  });
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: textOverflow,
        textAlign: textAlign,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration,
            fontFamily: fontFamily,
            fontStyle: fontStyle),
      ),
    );
  }
}
