// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      commentId: json['commentId'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      post: json['post'] == null
          ? null
          : Post.fromJson(json['post'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$CommentStatusEnumMap, json['status']),
      createAt: json['createAt'] as int?,
      updateAt: json['updateAt'] as int?,
      content: json['content'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'images': instance.images,
      'post': instance.post,
      'status': _$CommentStatusEnumMap[instance.status],
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'content': instance.content,
      'user': instance.user,
    };

const _$CommentStatusEnumMap = {
  CommentStatus.ACTIVE: 'ACTIVE',
  CommentStatus.INACTIVE: 'INACTIVE',
};
