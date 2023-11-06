import 'package:flutter/material.dart';

extension TextStyleExt on TextStyle {
  TextStyle w300() => copyWith(fontWeight: FontWeight.w300);

  TextStyle w400() => copyWith(fontWeight: FontWeight.w400);

  TextStyle w500() => copyWith(fontWeight: FontWeight.w500);

  TextStyle w600() => copyWith(fontWeight: FontWeight.w600);

  TextStyle w700() => copyWith(fontWeight: FontWeight.w700);

  TextStyle w800() => copyWith(fontWeight: FontWeight.w800);

  TextStyle custom({double? size, FontWeight? fontWeight, Color? color}) {
    return copyWith(
        fontSize: size ?? fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        color: color ?? this.color);
  }
}
