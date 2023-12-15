import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/generated/translations.g.dart';

enum Gender {
  @JsonValue("MALE")
  MALE,
  @JsonValue("FEMALE")
  FEMALE,
  @JsonValue("OTHER")
  OTHER,
}

extension GenderExt on Gender? {
  String get label =>
      {
        Gender.MALE: "Nam",
        Gender.FEMALE: "Nữ",
        Gender.OTHER: "Giới tính khác",
      }[this] ??
      tr(LocaleKeys.App_NotUpdate);

  IconData get icon =>
      {
        Gender.MALE: Icons.male,
        Gender.FEMALE: Icons.female,
        Gender.OTHER: Icons.person,
      }[this] ??
      Icons.person;
}
