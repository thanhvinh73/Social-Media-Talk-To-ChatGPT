// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiList<T> _$ApiListFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiList<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiList<T> {
  String? get status => throw _privateConstructorUsedError;
  List<T>? get data => throw _privateConstructorUsedError;
  Meta? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiListCopyWith<T, ApiList<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiListCopyWith<T, $Res> {
  factory $ApiListCopyWith(ApiList<T> value, $Res Function(ApiList<T>) then) =
      _$ApiListCopyWithImpl<T, $Res, ApiList<T>>;
  @useResult
  $Res call({String? status, List<T>? data, Meta? meta});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ApiListCopyWithImpl<T, $Res, $Val extends ApiList<T>>
    implements $ApiListCopyWith<T, $Res> {
  _$ApiListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiListImplCopyWith<T, $Res>
    implements $ApiListCopyWith<T, $Res> {
  factory _$$ApiListImplCopyWith(
          _$ApiListImpl<T> value, $Res Function(_$ApiListImpl<T>) then) =
      __$$ApiListImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? status, List<T>? data, Meta? meta});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$ApiListImplCopyWithImpl<T, $Res>
    extends _$ApiListCopyWithImpl<T, $Res, _$ApiListImpl<T>>
    implements _$$ApiListImplCopyWith<T, $Res> {
  __$$ApiListImplCopyWithImpl(
      _$ApiListImpl<T> _value, $Res Function(_$ApiListImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$ApiListImpl<T>(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiListImpl<T> implements _ApiList<T> {
  _$ApiListImpl(this.status, final List<T>? data, this.meta) : _data = data;

  factory _$ApiListImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiListImplFromJson(json, fromJsonT);

  @override
  final String? status;
  final List<T>? _data;
  @override
  List<T>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Meta? meta;

  @override
  String toString() {
    return 'ApiList<$T>(status: $status, data: $data, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiListImpl<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiListImplCopyWith<T, _$ApiListImpl<T>> get copyWith =>
      __$$ApiListImplCopyWithImpl<T, _$ApiListImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiListImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiList<T> implements ApiList<T> {
  factory _ApiList(
          final String? status, final List<T>? data, final Meta? meta) =
      _$ApiListImpl<T>;

  factory _ApiList.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiListImpl<T>.fromJson;

  @override
  String? get status;
  @override
  List<T>? get data;
  @override
  Meta? get meta;
  @override
  @JsonKey(ignore: true)
  _$$ApiListImplCopyWith<T, _$ApiListImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
