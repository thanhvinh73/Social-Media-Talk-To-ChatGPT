// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_to_speech_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TextToSpeechState {
  String? get errorMessage => throw _privateConstructorUsedError;
  bool? get isSpeaking => throw _privateConstructorUsedError;
  int get speakingMessageAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextToSpeechStateCopyWith<TextToSpeechState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextToSpeechStateCopyWith<$Res> {
  factory $TextToSpeechStateCopyWith(
          TextToSpeechState value, $Res Function(TextToSpeechState) then) =
      _$TextToSpeechStateCopyWithImpl<$Res, TextToSpeechState>;
  @useResult
  $Res call(
      {String? errorMessage, bool? isSpeaking, int speakingMessageAmount});
}

/// @nodoc
class _$TextToSpeechStateCopyWithImpl<$Res, $Val extends TextToSpeechState>
    implements $TextToSpeechStateCopyWith<$Res> {
  _$TextToSpeechStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isSpeaking = freezed,
    Object? speakingMessageAmount = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSpeaking: freezed == isSpeaking
          ? _value.isSpeaking
          : isSpeaking // ignore: cast_nullable_to_non_nullable
              as bool?,
      speakingMessageAmount: null == speakingMessageAmount
          ? _value.speakingMessageAmount
          : speakingMessageAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TextToSpeechStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage, bool? isSpeaking, int speakingMessageAmount});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TextToSpeechStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isSpeaking = freezed,
    Object? speakingMessageAmount = null,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSpeaking: freezed == isSpeaking
          ? _value.isSpeaking
          : isSpeaking // ignore: cast_nullable_to_non_nullable
              as bool?,
      speakingMessageAmount: null == speakingMessageAmount
          ? _value.speakingMessageAmount
          : speakingMessageAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.errorMessage,
      this.isSpeaking = false,
      this.speakingMessageAmount = 0});

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool? isSpeaking;
  @override
  @JsonKey()
  final int speakingMessageAmount;

  @override
  String toString() {
    return 'TextToSpeechState(errorMessage: $errorMessage, isSpeaking: $isSpeaking, speakingMessageAmount: $speakingMessageAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSpeaking, isSpeaking) ||
                other.isSpeaking == isSpeaking) &&
            (identical(other.speakingMessageAmount, speakingMessageAmount) ||
                other.speakingMessageAmount == speakingMessageAmount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, errorMessage, isSpeaking, speakingMessageAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements TextToSpeechState {
  const factory _Initial(
      {final String? errorMessage,
      final bool? isSpeaking,
      final int speakingMessageAmount}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  bool? get isSpeaking;
  @override
  int get speakingMessageAmount;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
