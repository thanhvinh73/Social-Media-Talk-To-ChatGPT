// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get id => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get dateOfBirth => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  FileModel? get avatar => throw _privateConstructorUsedError;
  FileModel? get coverPhoto => throw _privateConstructorUsedError;
  ProfileStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get avatarFile => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get coverPhotoFile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? id,
      String? firstname,
      String? lastname,
      String? phone,
      String? email,
      int? dateOfBirth,
      Gender? gender,
      FileModel? avatar,
      FileModel? coverPhoto,
      ProfileStatus? status,
      @JsonKey(includeFromJson: false, includeToJson: false) File? avatarFile,
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? coverPhotoFile});

  $FileModelCopyWith<$Res>? get avatar;
  $FileModelCopyWith<$Res>? get coverPhoto;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? avatar = freezed,
    Object? coverPhoto = freezed,
    Object? status = freezed,
    Object? avatarFile = freezed,
    Object? coverPhotoFile = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as FileModel?,
      coverPhoto: freezed == coverPhoto
          ? _value.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as FileModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileStatus?,
      avatarFile: freezed == avatarFile
          ? _value.avatarFile
          : avatarFile // ignore: cast_nullable_to_non_nullable
              as File?,
      coverPhotoFile: freezed == coverPhotoFile
          ? _value.coverPhotoFile
          : coverPhotoFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $FileModelCopyWith<$Res>(_value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<$Res>? get coverPhoto {
    if (_value.coverPhoto == null) {
      return null;
    }

    return $FileModelCopyWith<$Res>(_value.coverPhoto!, (value) {
      return _then(_value.copyWith(coverPhoto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firstname,
      String? lastname,
      String? phone,
      String? email,
      int? dateOfBirth,
      Gender? gender,
      FileModel? avatar,
      FileModel? coverPhoto,
      ProfileStatus? status,
      @JsonKey(includeFromJson: false, includeToJson: false) File? avatarFile,
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? coverPhotoFile});

  @override
  $FileModelCopyWith<$Res>? get avatar;
  @override
  $FileModelCopyWith<$Res>? get coverPhoto;
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? avatar = freezed,
    Object? coverPhoto = freezed,
    Object? status = freezed,
    Object? avatarFile = freezed,
    Object? coverPhotoFile = freezed,
  }) {
    return _then(_$ProfileImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as FileModel?,
      coverPhoto: freezed == coverPhoto
          ? _value.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as FileModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileStatus?,
      avatarFile: freezed == avatarFile
          ? _value.avatarFile
          : avatarFile // ignore: cast_nullable_to_non_nullable
              as File?,
      coverPhotoFile: freezed == coverPhotoFile
          ? _value.coverPhotoFile
          : coverPhotoFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {this.id,
      this.firstname,
      this.lastname,
      this.phone,
      this.email,
      this.dateOfBirth,
      this.gender,
      this.avatar,
      this.coverPhoto,
      this.status,
      @JsonKey(includeFromJson: false, includeToJson: false) this.avatarFile,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.coverPhotoFile});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String? id;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final int? dateOfBirth;
  @override
  final Gender? gender;
  @override
  final FileModel? avatar;
  @override
  final FileModel? coverPhoto;
  @override
  final ProfileStatus? status;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final File? avatarFile;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final File? coverPhotoFile;

  @override
  String toString() {
    return 'Profile(id: $id, firstname: $firstname, lastname: $lastname, phone: $phone, email: $email, dateOfBirth: $dateOfBirth, gender: $gender, avatar: $avatar, coverPhoto: $coverPhoto, status: $status, avatarFile: $avatarFile, coverPhotoFile: $coverPhotoFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.coverPhoto, coverPhoto) ||
                other.coverPhoto == coverPhoto) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.avatarFile, avatarFile) ||
                other.avatarFile == avatarFile) &&
            (identical(other.coverPhotoFile, coverPhotoFile) ||
                other.coverPhotoFile == coverPhotoFile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstname,
      lastname,
      phone,
      email,
      dateOfBirth,
      gender,
      avatar,
      coverPhoto,
      status,
      avatarFile,
      coverPhotoFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {final String? id,
      final String? firstname,
      final String? lastname,
      final String? phone,
      final String? email,
      final int? dateOfBirth,
      final Gender? gender,
      final FileModel? avatar,
      final FileModel? coverPhoto,
      final ProfileStatus? status,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final File? avatarFile,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final File? coverPhotoFile}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String? get id;
  @override
  String? get firstname;
  @override
  String? get lastname;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  int? get dateOfBirth;
  @override
  Gender? get gender;
  @override
  FileModel? get avatar;
  @override
  FileModel? get coverPhoto;
  @override
  ProfileStatus? get status;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get avatarFile;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get coverPhotoFile;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
