// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/shared/enum/role.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? email,
    String? firstname,
    String? lastname,
    @Default(Roles.USER) Roles role,
    int? createAt,
    FileModel? avatar,
    @JsonKey(includeFromJson: false, includeToJson: false) String? password,
    @JsonKey(includeFromJson: false, includeToJson: false)
    String? confirmPassword,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserExt on User? {
  String? get fullname {
    if (this == null) return null;
    return "${this!.firstname.isEmptyOrNull ? "" : "${this!.firstname} "}${this!.lastname ?? ""}";
  }
}
