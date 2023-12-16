// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateProfileScreenState {
  String? get errorMessage => throw _privateConstructorUsedError;
  ScreenStatus get status => throw _privateConstructorUsedError;
  String? get invalidDob => throw _privateConstructorUsedError;
  String? get invalidGender => throw _privateConstructorUsedError;
  Profile? get currentProfile => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage, ScreenStatus status,
            String? invalidDob, String? invalidGender, Profile? currentProfile)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage, ScreenStatus status,
            String? invalidDob, String? invalidGender, Profile? currentProfile)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage, ScreenStatus status,
            String? invalidDob, String? invalidGender, Profile? currentProfile)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateProfileScreenStateCopyWith<UpdateProfileScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileScreenStateCopyWith<$Res> {
  factory $UpdateProfileScreenStateCopyWith(UpdateProfileScreenState value,
          $Res Function(UpdateProfileScreenState) then) =
      _$UpdateProfileScreenStateCopyWithImpl<$Res, UpdateProfileScreenState>;
  @useResult
  $Res call(
      {String? errorMessage,
      ScreenStatus status,
      String? invalidDob,
      String? invalidGender,
      Profile? currentProfile});

  $ProfileCopyWith<$Res>? get currentProfile;
}

/// @nodoc
class _$UpdateProfileScreenStateCopyWithImpl<$Res,
        $Val extends UpdateProfileScreenState>
    implements $UpdateProfileScreenStateCopyWith<$Res> {
  _$UpdateProfileScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? status = null,
    Object? invalidDob = freezed,
    Object? invalidGender = freezed,
    Object? currentProfile = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      invalidDob: freezed == invalidDob
          ? _value.invalidDob
          : invalidDob // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidGender: freezed == invalidGender
          ? _value.invalidGender
          : invalidGender // ignore: cast_nullable_to_non_nullable
              as String?,
      currentProfile: freezed == currentProfile
          ? _value.currentProfile
          : currentProfile // ignore: cast_nullable_to_non_nullable
              as Profile?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get currentProfile {
    if (_value.currentProfile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.currentProfile!, (value) {
      return _then(_value.copyWith(currentProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $UpdateProfileScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      ScreenStatus status,
      String? invalidDob,
      String? invalidGender,
      Profile? currentProfile});

  @override
  $ProfileCopyWith<$Res>? get currentProfile;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UpdateProfileScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? status = null,
    Object? invalidDob = freezed,
    Object? invalidGender = freezed,
    Object? currentProfile = freezed,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      invalidDob: freezed == invalidDob
          ? _value.invalidDob
          : invalidDob // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidGender: freezed == invalidGender
          ? _value.invalidGender
          : invalidGender // ignore: cast_nullable_to_non_nullable
              as String?,
      currentProfile: freezed == currentProfile
          ? _value.currentProfile
          : currentProfile // ignore: cast_nullable_to_non_nullable
              as Profile?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.errorMessage,
      this.status = ScreenStatus.init,
      this.invalidDob,
      this.invalidGender,
      this.currentProfile});

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final ScreenStatus status;
  @override
  final String? invalidDob;
  @override
  final String? invalidGender;
  @override
  final Profile? currentProfile;

  @override
  String toString() {
    return 'UpdateProfileScreenState.initial(errorMessage: $errorMessage, status: $status, invalidDob: $invalidDob, invalidGender: $invalidGender, currentProfile: $currentProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.invalidDob, invalidDob) ||
                other.invalidDob == invalidDob) &&
            (identical(other.invalidGender, invalidGender) ||
                other.invalidGender == invalidGender) &&
            (identical(other.currentProfile, currentProfile) ||
                other.currentProfile == currentProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, status, invalidDob,
      invalidGender, currentProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage, ScreenStatus status,
            String? invalidDob, String? invalidGender, Profile? currentProfile)
        initial,
  }) {
    return initial(
        errorMessage, status, invalidDob, invalidGender, currentProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage, ScreenStatus status,
            String? invalidDob, String? invalidGender, Profile? currentProfile)?
        initial,
  }) {
    return initial?.call(
        errorMessage, status, invalidDob, invalidGender, currentProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage, ScreenStatus status,
            String? invalidDob, String? invalidGender, Profile? currentProfile)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          errorMessage, status, invalidDob, invalidGender, currentProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UpdateProfileScreenState {
  const factory _Initial(
      {final String? errorMessage,
      final ScreenStatus status,
      final String? invalidDob,
      final String? invalidGender,
      final Profile? currentProfile}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  ScreenStatus get status;
  @override
  String? get invalidDob;
  @override
  String? get invalidGender;
  @override
  Profile? get currentProfile;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
