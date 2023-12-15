import 'package:freezed_annotation/freezed_annotation.dart';

enum ProfileStatus {
  @JsonValue("ACTIVE")
  ACTIVE,
  @JsonValue("INACTIVE")
  INACTIVE
}
