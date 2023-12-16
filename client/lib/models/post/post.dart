// ignore_for_file: invalid_annotation_target

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/shared/enum/post_status.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    String? postId,
    User? authorUser,
    @Default([]) List<User> sharedUser,
    @Default([]) List<FileModel> images,
    PostStatus? status,
    String? title,
    String? description,
    int? createAt,
    bool? updated,
    int? commentsLength,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<File> imageFile,
  }) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
