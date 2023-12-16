// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String? get postId => throw _privateConstructorUsedError;
  User? get authorUser => throw _privateConstructorUsedError;
  List<User> get sharedUser => throw _privateConstructorUsedError;
  List<FileModel> get images => throw _privateConstructorUsedError;
  PostStatus? get status => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get createAt => throw _privateConstructorUsedError;
  bool? get updated => throw _privateConstructorUsedError;
  int? get commentsLength => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File> get imageFile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String? postId,
      User? authorUser,
      List<User> sharedUser,
      List<FileModel> images,
      PostStatus? status,
      String? title,
      String? description,
      int? createAt,
      bool? updated,
      int? commentsLength,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<File> imageFile});

  $UserCopyWith<$Res>? get authorUser;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
    Object? authorUser = freezed,
    Object? sharedUser = null,
    Object? images = null,
    Object? status = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? createAt = freezed,
    Object? updated = freezed,
    Object? commentsLength = freezed,
    Object? imageFile = null,
  }) {
    return _then(_value.copyWith(
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUser: freezed == authorUser
          ? _value.authorUser
          : authorUser // ignore: cast_nullable_to_non_nullable
              as User?,
      sharedUser: null == sharedUser
          ? _value.sharedUser
          : sharedUser // ignore: cast_nullable_to_non_nullable
              as List<User>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostStatus?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool?,
      commentsLength: freezed == commentsLength
          ? _value.commentsLength
          : commentsLength // ignore: cast_nullable_to_non_nullable
              as int?,
      imageFile: null == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get authorUser {
    if (_value.authorUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.authorUser!, (value) {
      return _then(_value.copyWith(authorUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? postId,
      User? authorUser,
      List<User> sharedUser,
      List<FileModel> images,
      PostStatus? status,
      String? title,
      String? description,
      int? createAt,
      bool? updated,
      int? commentsLength,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<File> imageFile});

  @override
  $UserCopyWith<$Res>? get authorUser;
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
    Object? authorUser = freezed,
    Object? sharedUser = null,
    Object? images = null,
    Object? status = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? createAt = freezed,
    Object? updated = freezed,
    Object? commentsLength = freezed,
    Object? imageFile = null,
  }) {
    return _then(_$PostImpl(
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUser: freezed == authorUser
          ? _value.authorUser
          : authorUser // ignore: cast_nullable_to_non_nullable
              as User?,
      sharedUser: null == sharedUser
          ? _value._sharedUser
          : sharedUser // ignore: cast_nullable_to_non_nullable
              as List<User>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostStatus?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool?,
      commentsLength: freezed == commentsLength
          ? _value.commentsLength
          : commentsLength // ignore: cast_nullable_to_non_nullable
              as int?,
      imageFile: null == imageFile
          ? _value._imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {this.postId,
      this.authorUser,
      final List<User> sharedUser = const [],
      final List<FileModel> images = const [],
      this.status,
      this.title,
      this.description,
      this.createAt,
      this.updated,
      this.commentsLength,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<File> imageFile = const []})
      : _sharedUser = sharedUser,
        _images = images,
        _imageFile = imageFile;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String? postId;
  @override
  final User? authorUser;
  final List<User> _sharedUser;
  @override
  @JsonKey()
  List<User> get sharedUser {
    if (_sharedUser is EqualUnmodifiableListView) return _sharedUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sharedUser);
  }

  final List<FileModel> _images;
  @override
  @JsonKey()
  List<FileModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final PostStatus? status;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? createAt;
  @override
  final bool? updated;
  @override
  final int? commentsLength;
  final List<File> _imageFile;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File> get imageFile {
    if (_imageFile is EqualUnmodifiableListView) return _imageFile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageFile);
  }

  @override
  String toString() {
    return 'Post(postId: $postId, authorUser: $authorUser, sharedUser: $sharedUser, images: $images, status: $status, title: $title, description: $description, createAt: $createAt, updated: $updated, commentsLength: $commentsLength, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.authorUser, authorUser) ||
                other.authorUser == authorUser) &&
            const DeepCollectionEquality()
                .equals(other._sharedUser, _sharedUser) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.commentsLength, commentsLength) ||
                other.commentsLength == commentsLength) &&
            const DeepCollectionEquality()
                .equals(other._imageFile, _imageFile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postId,
      authorUser,
      const DeepCollectionEquality().hash(_sharedUser),
      const DeepCollectionEquality().hash(_images),
      status,
      title,
      description,
      createAt,
      updated,
      commentsLength,
      const DeepCollectionEquality().hash(_imageFile));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {final String? postId,
      final User? authorUser,
      final List<User> sharedUser,
      final List<FileModel> images,
      final PostStatus? status,
      final String? title,
      final String? description,
      final int? createAt,
      final bool? updated,
      final int? commentsLength,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<File> imageFile}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String? get postId;
  @override
  User? get authorUser;
  @override
  List<User> get sharedUser;
  @override
  List<FileModel> get images;
  @override
  PostStatus? get status;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get createAt;
  @override
  bool? get updated;
  @override
  int? get commentsLength;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File> get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
