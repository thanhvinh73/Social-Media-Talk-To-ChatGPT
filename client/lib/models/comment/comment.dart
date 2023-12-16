// ignore_for_file: invalid_annotation_target

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/shared/enum/comment_status.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    String? commentId,
    @Default([]) List<FileModel> images,
    Post? post,
    CommentStatus? status,
    int? createAt,
    int? updateAt,
    String? content,
    User? user,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<File> files,
  }) = _Comment;
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
