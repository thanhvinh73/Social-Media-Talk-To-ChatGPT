// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      currentPage: json['current_page'] as int? ?? 0,
      nextPage: json['next_page'] as int? ?? 0,
      prevPage: json['prev_page'] as int? ?? 0,
      totalPages: json['total_pages'] as int? ?? 0,
      totalCount: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
      'total_pages': instance.totalPages,
      'total_count': instance.totalCount,
    };
