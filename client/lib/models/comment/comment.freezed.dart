// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String? get commentId => throw _privateConstructorUsedError;
  List<FileModel> get images => throw _privateConstructorUsedError;
  Post? get post => throw _privateConstructorUsedError;
  CommentStatus? get status => throw _privateConstructorUsedError;
  int? get createAt => throw _privateConstructorUsedError;
  int? get updateAt => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {String? commentId,
      List<FileModel> images,
      Post? post,
      CommentStatus? status,
      int? createAt,
      int? updateAt,
      String? content});

  $PostCopyWith<$Res>? get post;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = freezed,
    Object? images = null,
    Object? post = freezed,
    Object? status = freezed,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommentStatus?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res>? get post {
    if (_value.post == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_value.post!, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? commentId,
      List<FileModel> images,
      Post? post,
      CommentStatus? status,
      int? createAt,
      int? updateAt,
      String? content});

  @override
  $PostCopyWith<$Res>? get post;
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = freezed,
    Object? images = null,
    Object? post = freezed,
    Object? status = freezed,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_$CommentImpl(
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommentStatus?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {this.commentId,
      final List<FileModel> images = const [],
      this.post,
      this.status,
      this.createAt,
      this.updateAt,
      this.content})
      : _images = images;

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String? commentId;
  final List<FileModel> _images;
  @override
  @JsonKey()
  List<FileModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final Post? post;
  @override
  final CommentStatus? status;
  @override
  final int? createAt;
  @override
  final int? updateAt;
  @override
  final String? content;

  @override
  String toString() {
    return 'Comment(commentId: $commentId, images: $images, post: $post, status: $status, createAt: $createAt, updateAt: $updateAt, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      commentId,
      const DeepCollectionEquality().hash(_images),
      post,
      status,
      createAt,
      updateAt,
      content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {final String? commentId,
      final List<FileModel> images,
      final Post? post,
      final CommentStatus? status,
      final int? createAt,
      final int? updateAt,
      final String? content}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String? get commentId;
  @override
  List<FileModel> get images;
  @override
  Post? get post;
  @override
  CommentStatus? get status;
  @override
  int? get createAt;
  @override
  int? get updateAt;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
