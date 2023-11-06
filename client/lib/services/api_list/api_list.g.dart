// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiListImpl<T> _$$ApiListImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiListImpl<T>(
      json['status'] as String?,
      (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiListImplToJson<T>(
  _$ApiListImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data?.map(toJsonT).toList(),
      'meta': instance.meta,
    };
