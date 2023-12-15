import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/file/file.dart';
import 'package:social_media_with_chatgpt/shared/enum/gender.dart';
import 'package:social_media_with_chatgpt/shared/enum/profile_status.dart';

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
    File? avatar,
    File? coverPhoto,
    ProfileStatus? status,
  }) = _Profile;
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
