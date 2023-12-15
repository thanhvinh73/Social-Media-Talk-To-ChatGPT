import 'package:freezed_annotation/freezed_annotation.dart';

enum Gender {
  @JsonValue("MALE")
  MALE,
  @JsonValue("FEMALE")
  FEMALE,
  @JsonValue("OTHER")
  OTHER,
}
