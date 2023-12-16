// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      postId: json['postId'] as String?,
      authorUser: json['authorUser'] == null
          ? null
          : User.fromJson(json['authorUser'] as Map<String, dynamic>),
      sharedUser: (json['sharedUser'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: $enumDecodeNullable(_$PostStatusEnumMap, json['status']),
      title: json['title'] as String?,
      description: json['description'] as String?,
      createAt: json['createAt'] as int?,
      updated: json['updated'] as bool?,
      commentsLength: json['commentsLength'] as int?,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'authorUser': instance.authorUser,
      'sharedUser': instance.sharedUser,
      'images': instance.images,
      'status': _$PostStatusEnumMap[instance.status],
      'title': instance.title,
      'description': instance.description,
      'createAt': instance.createAt,
      'updated': instance.updated,
      'commentsLength': instance.commentsLength,
    };

const _$PostStatusEnumMap = {
  PostStatus.ACTIVE: 'ACTIVE',
  PostStatus.INACTIVE: 'INACTIVE',
};
