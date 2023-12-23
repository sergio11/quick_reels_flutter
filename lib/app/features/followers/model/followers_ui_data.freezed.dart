// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followers_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FollowersUiState {
  List<UserBO> get users => throw _privateConstructorUsedError;
  String get authUserUid => throw _privateConstructorUsedError;
  String get userUid => throw _privateConstructorUsedError;
  ContentTypeEnum get contentType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowersUiStateCopyWith<FollowersUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowersUiStateCopyWith<$Res> {
  factory $FollowersUiStateCopyWith(
          FollowersUiState value, $Res Function(FollowersUiState) then) =
      _$FollowersUiStateCopyWithImpl<$Res, FollowersUiState>;
  @useResult
  $Res call(
      {List<UserBO> users,
      String authUserUid,
      String userUid,
      ContentTypeEnum contentType});
}

/// @nodoc
class _$FollowersUiStateCopyWithImpl<$Res, $Val extends FollowersUiState>
    implements $FollowersUiStateCopyWith<$Res> {
  _$FollowersUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? authUserUid = null,
    Object? userUid = null,
    Object? contentType = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      authUserUid: null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentTypeEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowersUiStateImplCopyWith<$Res>
    implements $FollowersUiStateCopyWith<$Res> {
  factory _$$FollowersUiStateImplCopyWith(_$FollowersUiStateImpl value,
          $Res Function(_$FollowersUiStateImpl) then) =
      __$$FollowersUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserBO> users,
      String authUserUid,
      String userUid,
      ContentTypeEnum contentType});
}

/// @nodoc
class __$$FollowersUiStateImplCopyWithImpl<$Res>
    extends _$FollowersUiStateCopyWithImpl<$Res, _$FollowersUiStateImpl>
    implements _$$FollowersUiStateImplCopyWith<$Res> {
  __$$FollowersUiStateImplCopyWithImpl(_$FollowersUiStateImpl _value,
      $Res Function(_$FollowersUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? authUserUid = null,
    Object? userUid = null,
    Object? contentType = null,
  }) {
    return _then(_$FollowersUiStateImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      authUserUid: null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentTypeEnum,
    ));
  }
}

/// @nodoc

class _$FollowersUiStateImpl implements _FollowersUiState {
  const _$FollowersUiStateImpl(
      {final List<UserBO> users = const [],
      this.authUserUid = "",
      this.userUid = "",
      this.contentType = ContentTypeEnum.followers})
      : _users = users;

  final List<UserBO> _users;
  @override
  @JsonKey()
  List<UserBO> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey()
  final String authUserUid;
  @override
  @JsonKey()
  final String userUid;
  @override
  @JsonKey()
  final ContentTypeEnum contentType;

  @override
  String toString() {
    return 'FollowersUiState(users: $users, authUserUid: $authUserUid, userUid: $userUid, contentType: $contentType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowersUiStateImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.authUserUid, authUserUid) ||
                other.authUserUid == authUserUid) &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      authUserUid,
      userUid,
      contentType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowersUiStateImplCopyWith<_$FollowersUiStateImpl> get copyWith =>
      __$$FollowersUiStateImplCopyWithImpl<_$FollowersUiStateImpl>(
          this, _$identity);
}

abstract class _FollowersUiState implements FollowersUiState {
  const factory _FollowersUiState(
      {final List<UserBO> users,
      final String authUserUid,
      final String userUid,
      final ContentTypeEnum contentType}) = _$FollowersUiStateImpl;

  @override
  List<UserBO> get users;
  @override
  String get authUserUid;
  @override
  String get userUid;
  @override
  ContentTypeEnum get contentType;
  @override
  @JsonKey(ignore: true)
  _$$FollowersUiStateImplCopyWith<_$FollowersUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
