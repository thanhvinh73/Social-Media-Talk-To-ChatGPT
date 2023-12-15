import 'package:freezed_annotation/freezed_annotation.dart';

enum PostStatus {
  @JsonValue("ACTIVE")
  ACTIVE,
  @JsonValue("INACTIVE")
  INACTIVE
}
