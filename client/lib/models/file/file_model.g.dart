// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileModelImpl _$$FileModelImplFromJson(Map<String, dynamic> json) =>
    _$FileModelImpl(
      fileId: json['fileId'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      size: json['size'] as int?,
      mimeType: json['mimeType'] as String?,
      createAt: json['createAt'] as int?,
    );

Map<String, dynamic> _$$FileModelImplToJson(_$FileModelImpl instance) =>
    <String, dynamic>{
      'fileId': instance.fileId,
      'name': instance.name,
      'url': instance.url,
      'size': instance.size,
      'mimeType': instance.mimeType,
      'createAt': instance.createAt,
    };
