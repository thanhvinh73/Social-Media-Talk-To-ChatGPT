// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreatePostScreenState {
  String? get errorMessage => throw _privateConstructorUsedError;
  Post? get currentPost => throw _privateConstructorUsedError;
  bool get isUpdate => throw _privateConstructorUsedError;
  ScreenStatus get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage, Post? currentPost,
            bool isUpdate, ScreenStatus status)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage, Post? currentPost, bool isUpdate,
            ScreenStatus status)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage, Post? currentPost, bool isUpdate,
            ScreenStatus status)?
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
  $CreatePostScreenStateCopyWith<CreatePostScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostScreenStateCopyWith<$Res> {
  factory $CreatePostScreenStateCopyWith(CreatePostScreenState value,
          $Res Function(CreatePostScreenState) then) =
      _$CreatePostScreenStateCopyWithImpl<$Res, CreatePostScreenState>;
  @useResult
  $Res call(
      {String? errorMessage,
      Post? currentPost,
      bool isUpdate,
      ScreenStatus status});

  $PostCopyWith<$Res>? get currentPost;
}

/// @nodoc
class _$CreatePostScreenStateCopyWithImpl<$Res,
        $Val extends CreatePostScreenState>
    implements $CreatePostScreenStateCopyWith<$Res> {
  _$CreatePostScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? currentPost = freezed,
    Object? isUpdate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPost: freezed == currentPost
          ? _value.currentPost
          : currentPost // ignore: cast_nullable_to_non_nullable
              as Post?,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res>? get currentPost {
    if (_value.currentPost == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_value.currentPost!, (value) {
      return _then(_value.copyWith(currentPost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CreatePostScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      Post? currentPost,
      bool isUpdate,
      ScreenStatus status});

  @override
  $PostCopyWith<$Res>? get currentPost;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CreatePostScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? currentPost = freezed,
    Object? isUpdate = null,
    Object? status = null,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPost: freezed == currentPost
          ? _value.currentPost
          : currentPost // ignore: cast_nullable_to_non_nullable
              as Post?,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.errorMessage,
      this.currentPost,
      this.isUpdate = false,
      this.status = ScreenStatus.init});

  @override
  final String? errorMessage;
  @override
  final Post? currentPost;
  @override
  @JsonKey()
  final bool isUpdate;
  @override
  @JsonKey()
  final ScreenStatus status;

  @override
  String toString() {
    return 'CreatePostScreenState.initial(errorMessage: $errorMessage, currentPost: $currentPost, isUpdate: $isUpdate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentPost, currentPost) ||
                other.currentPost == currentPost) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, errorMessage, currentPost, isUpdate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage, Post? currentPost,
            bool isUpdate, ScreenStatus status)
        initial,
  }) {
    return initial(errorMessage, currentPost, isUpdate, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage, Post? currentPost, bool isUpdate,
            ScreenStatus status)?
        initial,
  }) {
    return initial?.call(errorMessage, currentPost, isUpdate, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage, Post? currentPost, bool isUpdate,
            ScreenStatus status)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(errorMessage, currentPost, isUpdate, status);
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

abstract class _Initial implements CreatePostScreenState {
  const factory _Initial(
      {final String? errorMessage,
      final Post? currentPost,
      final bool isUpdate,
      final ScreenStatus status}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  Post? get currentPost;
  @override
  bool get isUpdate;
  @override
  ScreenStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
