// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileUiData {
  UserBO? get userData => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  String get userUuid => throw _privateConstructorUsedError;
  bool get isAuthUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileUiDataCopyWith<ProfileUiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileUiDataCopyWith<$Res> {
  factory $ProfileUiDataCopyWith(
          ProfileUiData value, $Res Function(ProfileUiData) then) =
      _$ProfileUiDataCopyWithImpl<$Res, ProfileUiData>;
  @useResult
  $Res call(
      {UserBO? userData, bool isFollowing, String userUuid, bool isAuthUser});
}

/// @nodoc
class _$ProfileUiDataCopyWithImpl<$Res, $Val extends ProfileUiData>
    implements $ProfileUiDataCopyWith<$Res> {
  _$ProfileUiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? isFollowing = null,
    Object? userUuid = null,
    Object? isAuthUser = null,
  }) {
    return _then(_value.copyWith(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserBO?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthUser: null == isAuthUser
          ? _value.isAuthUser
          : isAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileUpUiDataImplCopyWith<$Res>
    implements $ProfileUiDataCopyWith<$Res> {
  factory _$$ProfileUpUiDataImplCopyWith(_$ProfileUpUiDataImpl value,
          $Res Function(_$ProfileUpUiDataImpl) then) =
      __$$ProfileUpUiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserBO? userData, bool isFollowing, String userUuid, bool isAuthUser});
}

/// @nodoc
class __$$ProfileUpUiDataImplCopyWithImpl<$Res>
    extends _$ProfileUiDataCopyWithImpl<$Res, _$ProfileUpUiDataImpl>
    implements _$$ProfileUpUiDataImplCopyWith<$Res> {
  __$$ProfileUpUiDataImplCopyWithImpl(
      _$ProfileUpUiDataImpl _value, $Res Function(_$ProfileUpUiDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? isFollowing = null,
    Object? userUuid = null,
    Object? isAuthUser = null,
  }) {
    return _then(_$ProfileUpUiDataImpl(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserBO?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthUser: null == isAuthUser
          ? _value.isAuthUser
          : isAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProfileUpUiDataImpl implements _ProfileUpUiData {
  const _$ProfileUpUiDataImpl(
      {this.userData,
      this.isFollowing = false,
      this.userUuid = "",
      this.isAuthUser = false});

  @override
  final UserBO? userData;
  @override
  @JsonKey()
  final bool isFollowing;
  @override
  @JsonKey()
  final String userUuid;
  @override
  @JsonKey()
  final bool isAuthUser;

  @override
  String toString() {
    return 'ProfileUiData(userData: $userData, isFollowing: $isFollowing, userUuid: $userUuid, isAuthUser: $isAuthUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpUiDataImpl &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            (identical(other.isAuthUser, isAuthUser) ||
                other.isAuthUser == isAuthUser));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userData, isFollowing, userUuid, isAuthUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUpUiDataImplCopyWith<_$ProfileUpUiDataImpl> get copyWith =>
      __$$ProfileUpUiDataImplCopyWithImpl<_$ProfileUpUiDataImpl>(
          this, _$identity);
}

abstract class _ProfileUpUiData implements ProfileUiData {
  const factory _ProfileUpUiData(
      {final UserBO? userData,
      final bool isFollowing,
      final String userUuid,
      final bool isAuthUser}) = _$ProfileUpUiDataImpl;

  @override
  UserBO? get userData;
  @override
  bool get isFollowing;
  @override
  String get userUuid;
  @override
  bool get isAuthUser;
  @override
  @JsonKey(ignore: true)
  _$$ProfileUpUiDataImplCopyWith<_$ProfileUpUiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}