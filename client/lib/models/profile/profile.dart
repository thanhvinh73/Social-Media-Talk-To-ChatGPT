// ignore_for_file: invalid_annotation_target

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/shared/enum/gender.dart';
import 'package:social_media_with_chatgpt/shared/enum/profile_status.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    String? id,
    String? firstname,
    String? lastname,
    String? phone,
    String? email,
    int? dateOfBirth,
    Gender? gender,
    FileModel? avatar,
    FileModel? coverPhoto,
    ProfileStatus? status,
    @JsonKey(includeFromJson: false, includeToJson: false) File? avatarFile,
    @JsonKey(includeFromJson: false, includeToJson: false) File? coverPhotoFile,
  }) = _Profile;
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

extension ProfileExt on Profile? {
  String? get fullname {
    if (this == null) return null;
    return "${this!.firstname.isEmptyOrNull ? "" : "${this!.firstname} "}${this!.lastname ?? ""}";
  }
}
