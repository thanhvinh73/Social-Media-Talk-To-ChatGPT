import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';


class AppText extends StatelessWidget {
  final String? content;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  final double? height;
  final FontStyle? fontStyle;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final EdgeInsets padding;

  const AppText(
    this.content, {
    super.key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.bodyText,
    this.height,
    this.decoration = TextDecoration.none,
    this.fontStyle,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.overflow,
    this.softWrap = true,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        content ?? '',
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        style: GoogleFonts.notoSans(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            height: height,
            decoration: decoration),
      ),
    );
  }
}

class PrimaryRequiredLabel extends StatelessWidget {
  final String label;
  final bool isRequired;
  const PrimaryRequiredLabel(this.label, this.isRequired, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RequiredLabel(label,
        textColor: AppColors.orange, isRequired: isRequired);
  }
}

class RequiredLabel extends StatelessWidget {
  final String label;
  final Color textColor;
  final bool isRequired;
  const RequiredLabel(this.label,
      {Key? key, this.textColor = AppColors.orange, required this.isRequired})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.centerLeft,
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 16),
      child: RichText(
        textScaleFactor: MediaQuery.textScaleFactorOf(context),
        text: TextSpan(
            style: GoogleFonts.notoSans(
                fontSize: 16, fontWeight: FontWeight.w600, color: textColor),
            children: [
              TextSpan(
                  text: label,
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor)),
              (isRequired == true)
                  ? const TextSpan(
                      text: ' *',
                      style: TextStyle(
                          color: Colors.red,
                          textBaseline: TextBaseline.ideographic))
                  : const TextSpan(),
            ]),
      ),
    );
  }
}
