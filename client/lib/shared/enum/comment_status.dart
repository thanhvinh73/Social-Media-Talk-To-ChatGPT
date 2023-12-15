import 'package:freezed_annotation/freezed_annotation.dart';

enum CommentStatus {
  @JsonValue("ACTIVE")
  ACTIVE,
  @JsonValue("INACTIVE")
  INACTIVE
}
