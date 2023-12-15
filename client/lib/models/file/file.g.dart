// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileImpl _$$FileImplFromJson(Map<String, dynamic> json) => _$FileImpl(
      fileId: json['fileId'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      size: json['size'] as int?,
      mimeType: json['mimeType'] as String?,
      createAt: json['createAt'] as int?,
    );

Map<String, dynamic> _$$FileImplToJson(_$FileImpl instance) =>
    <String, dynamic>{
      'fileId': instance.fileId,
      'name': instance.name,
      'url': instance.url,
      'size': instance.size,
      'mimeType': instance.mimeType,
      'createAt': instance.createAt,
    };
