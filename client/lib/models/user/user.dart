// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/shared/enum/role.dart';

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
    @JsonKey(includeFromJson: false, includeToJson: false) String? password,
    @JsonKey(includeFromJson: false, includeToJson: false)
    String? confirmPassword,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
