// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfileUiState {
  String get userUid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  Uint8List? get pickedImageData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileUiStateCopyWith<EditProfileUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileUiStateCopyWith<$Res> {
  factory $EditProfileUiStateCopyWith(
          EditProfileUiState value, $Res Function(EditProfileUiState) then) =
      _$EditProfileUiStateCopyWithImpl<$Res, EditProfileUiState>;
  @useResult
  $Res call(
      {String userUid,
      String username,
      String email,
      String bio,
      String photoUrl,
      Uint8List? pickedImageData});
}

/// @nodoc
class _$EditProfileUiStateCopyWithImpl<$Res, $Val extends EditProfileUiState>
    implements $EditProfileUiStateCopyWith<$Res> {
  _$EditProfileUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? username = null,
    Object? email = null,
    Object? bio = null,
    Object? photoUrl = null,
    Object? pickedImageData = freezed,
  }) {
    return _then(_value.copyWith(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pickedImageData: freezed == pickedImageData
          ? _value.pickedImageData
          : pickedImageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProfileUiStateImplCopyWith<$Res>
    implements $EditProfileUiStateCopyWith<$Res> {
  factory _$$EditProfileUiStateImplCopyWith(_$EditProfileUiStateImpl value,
          $Res Function(_$EditProfileUiStateImpl) then) =
      __$$EditProfileUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userUid,
      String username,
      String email,
      String bio,
      String photoUrl,
      Uint8List? pickedImageData});
}

/// @nodoc
class __$$EditProfileUiStateImplCopyWithImpl<$Res>
    extends _$EditProfileUiStateCopyWithImpl<$Res, _$EditProfileUiStateImpl>
    implements _$$EditProfileUiStateImplCopyWith<$Res> {
  __$$EditProfileUiStateImplCopyWithImpl(_$EditProfileUiStateImpl _value,
      $Res Function(_$EditProfileUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? username = null,
    Object? email = null,
    Object? bio = null,
    Object? photoUrl = null,
    Object? pickedImageData = freezed,
  }) {
    return _then(_$EditProfileUiStateImpl(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pickedImageData: freezed == pickedImageData
          ? _value.pickedImageData
          : pickedImageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$EditProfileUiStateImpl implements _EditProfileUiState {
  const _$EditProfileUiStateImpl(
      {this.userUid = "",
      this.username = "",
      this.email = "",
      this.bio = "",
      this.photoUrl = "",
      this.pickedImageData});

  @override
  @JsonKey()
  final String userUid;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final String photoUrl;
  @override
  final Uint8List? pickedImageData;

  @override
  String toString() {
    return 'EditProfileUiState(userUid: $userUid, username: $username, email: $email, bio: $bio, photoUrl: $photoUrl, pickedImageData: $pickedImageData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileUiStateImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.pickedImageData, pickedImageData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUid, username, email, bio,
      photoUrl, const DeepCollectionEquality().hash(pickedImageData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileUiStateImplCopyWith<_$EditProfileUiStateImpl> get copyWith =>
      __$$EditProfileUiStateImplCopyWithImpl<_$EditProfileUiStateImpl>(
          this, _$identity);
}

abstract class _EditProfileUiState implements EditProfileUiState {
  const factory _EditProfileUiState(
      {final String userUid,
      final String username,
      final String email,
      final String bio,
      final String photoUrl,
      final Uint8List? pickedImageData}) = _$EditProfileUiStateImpl;

  @override
  String get userUid;
  @override
  String get username;
  @override
  String get email;
  @override
  String get bio;
  @override
  String get photoUrl;
  @override
  Uint8List? get pickedImageData;
  @override
  @JsonKey(ignore: true)
  _$$EditProfileUiStateImplCopyWith<_$EditProfileUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
