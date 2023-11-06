import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SearchHighlightText extends StatelessWidget {
  const SearchHighlightText(
      {super.key,
      required this.text,
      required this.searchText,
      this.style,
      this.maxLines,
      this.overflow,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.textScaleFactor,
      this.highlightStyle});

  final String text;
  final String searchText;
  final TextStyle? style;
  final TextStyle? highlightStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final double? textScaleFactor;

  @override
  Widget build(BuildContext context) {
    RegExp? searchRegExp = RegExp(searchText);

    final highlightStyle =
        this.highlightStyle ?? const TextStyle(color: AppColors.red);

    final textSpans = <TextSpan>[];
    int endIndex = 0;
    for (final match in searchRegExp.allMatches(text)) {
      if (match.start > endIndex) {
        textSpans.add(TextSpan(
            text: text.substring(endIndex, match.start), style: style));
      }
      textSpans.add(TextSpan(
          text: text.substring(match.start, match.end), style: highlightStyle));
      endIndex = match.end;
    }
    if (endIndex < text.length) {
      textSpans.add(
        TextSpan(
          text: text.substring(endIndex),
          style: style,
        ),
      );
    }
    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection,
      softWrap: softWrap ?? true,
      textScaleFactor: textScaleFactor ?? 1.0,
    );
  }
}
