// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileModel _$FileModelFromJson(Map<String, dynamic> json) {
  return _FileModel.fromJson(json);
}

/// @nodoc
mixin _$FileModel {
  String? get fileId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  int? get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileModelCopyWith<FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) then) =
      _$FileModelCopyWithImpl<$Res, FileModel>;
  @useResult
  $Res call(
      {String? fileId,
      String? name,
      String? url,
      int? size,
      String? mimeType,
      int? createAt});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res, $Val extends FileModel>
    implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? mimeType = freezed,
    Object? createAt = freezed,
  }) {
    return _then(_value.copyWith(
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileModelImplCopyWith<$Res>
    implements $FileModelCopyWith<$Res> {
  factory _$$FileModelImplCopyWith(
          _$FileModelImpl value, $Res Function(_$FileModelImpl) then) =
      __$$FileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? fileId,
      String? name,
      String? url,
      int? size,
      String? mimeType,
      int? createAt});
}

/// @nodoc
class __$$FileModelImplCopyWithImpl<$Res>
    extends _$FileModelCopyWithImpl<$Res, _$FileModelImpl>
    implements _$$FileModelImplCopyWith<$Res> {
  __$$FileModelImplCopyWithImpl(
      _$FileModelImpl _value, $Res Function(_$FileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? mimeType = freezed,
    Object? createAt = freezed,
  }) {
    return _then(_$FileModelImpl(
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileModelImpl implements _FileModel {
  const _$FileModelImpl(
      {this.fileId,
      this.name,
      this.url,
      this.size,
      this.mimeType,
      this.createAt});

  factory _$FileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileModelImplFromJson(json);

  @override
  final String? fileId;
  @override
  final String? name;
  @override
  final String? url;
  @override
  final int? size;
  @override
  final String? mimeType;
  @override
  final int? createAt;

  @override
  String toString() {
    return 'FileModel(fileId: $fileId, name: $name, url: $url, size: $size, mimeType: $mimeType, createAt: $createAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileModelImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fileId, name, url, size, mimeType, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileModelImplCopyWith<_$FileModelImpl> get copyWith =>
      __$$FileModelImplCopyWithImpl<_$FileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileModelImplToJson(
      this,
    );
  }
}

abstract class _FileModel implements FileModel {
  const factory _FileModel(
      {final String? fileId,
      final String? name,
      final String? url,
      final int? size,
      final String? mimeType,
      final int? createAt}) = _$FileModelImpl;

  factory _FileModel.fromJson(Map<String, dynamic> json) =
      _$FileModelImpl.fromJson;

  @override
  String? get fileId;
  @override
  String? get name;
  @override
  String? get url;
  @override
  int? get size;
  @override
  String? get mimeType;
  @override
  int? get createAt;
  @override
  @JsonKey(ignore: true)
  _$$FileModelImplCopyWith<_$FileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
