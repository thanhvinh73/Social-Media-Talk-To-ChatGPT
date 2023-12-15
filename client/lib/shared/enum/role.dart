import 'package:freezed_annotation/freezed_annotation.dart';

enum Roles {
  @JsonValue("USER")
  USER,
  @JsonValue("ADMIN")
  ADMIN
}
