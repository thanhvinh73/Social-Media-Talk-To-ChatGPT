// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_screent_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountScreentState {
  String? get errorMessage => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  ScreenStatus get status => throw _privateConstructorUsedError;
  List<Post> get myPosts => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage, Profile? profile,
            ScreenStatus status, List<Post> myPosts)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage, Profile? profile,
            ScreenStatus status, List<Post> myPosts)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage, Profile? profile,
            ScreenStatus status, List<Post> myPosts)?
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
  $AccountScreentStateCopyWith<AccountScreentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountScreentStateCopyWith<$Res> {
  factory $AccountScreentStateCopyWith(
          AccountScreentState value, $Res Function(AccountScreentState) then) =
      _$AccountScreentStateCopyWithImpl<$Res, AccountScreentState>;
  @useResult
  $Res call(
      {String? errorMessage,
      Profile? profile,
      ScreenStatus status,
      List<Post> myPosts});

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$AccountScreentStateCopyWithImpl<$Res, $Val extends AccountScreentState>
    implements $AccountScreentStateCopyWith<$Res> {
  _$AccountScreentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profile = freezed,
    Object? status = null,
    Object? myPosts = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      myPosts: null == myPosts
          ? _value.myPosts
          : myPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AccountScreentStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      Profile? profile,
      ScreenStatus status,
      List<Post> myPosts});

  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AccountScreentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profile = freezed,
    Object? status = null,
    Object? myPosts = null,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      myPosts: null == myPosts
          ? _value._myPosts
          : myPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.errorMessage,
      this.profile,
      this.status = ScreenStatus.init,
      final List<Post> myPosts = const []})
      : _myPosts = myPosts;

  @override
  final String? errorMessage;
  @override
  final Profile? profile;
  @override
  @JsonKey()
  final ScreenStatus status;
  final List<Post> _myPosts;
  @override
  @JsonKey()
  List<Post> get myPosts {
    if (_myPosts is EqualUnmodifiableListView) return _myPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myPosts);
  }

  @override
  String toString() {
    return 'AccountScreentState.initial(errorMessage: $errorMessage, profile: $profile, status: $status, myPosts: $myPosts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._myPosts, _myPosts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, profile, status,
      const DeepCollectionEquality().hash(_myPosts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage, Profile? profile,
            ScreenStatus status, List<Post> myPosts)
        initial,
  }) {
    return initial(errorMessage, profile, status, myPosts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage, Profile? profile,
            ScreenStatus status, List<Post> myPosts)?
        initial,
  }) {
    return initial?.call(errorMessage, profile, status, myPosts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage, Profile? profile,
            ScreenStatus status, List<Post> myPosts)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(errorMessage, profile, status, myPosts);
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

abstract class _Initial implements AccountScreentState {
  const factory _Initial(
      {final String? errorMessage,
      final Profile? profile,
      final ScreenStatus status,
      final List<Post> myPosts}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  Profile? get profile;
  @override
  ScreenStatus get status;
  @override
  List<Post> get myPosts;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
