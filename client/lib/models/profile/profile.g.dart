// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] as int?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      avatar: json['avatar'] == null
          ? null
          : FileModel.fromJson(json['avatar'] as Map<String, dynamic>),
      coverPhoto: json['coverPhoto'] == null
          ? null
          : FileModel.fromJson(json['coverPhoto'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$ProfileStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'gender': _$GenderEnumMap[instance.gender],
      'avatar': instance.avatar,
      'coverPhoto': instance.coverPhoto,
      'status': _$ProfileStatusEnumMap[instance.status],
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
  Gender.OTHER: 'OTHER',
};

const _$ProfileStatusEnumMap = {
  ProfileStatus.ACTIVE: 'ACTIVE',
  ProfileStatus.INACTIVE: 'INACTIVE',
};
