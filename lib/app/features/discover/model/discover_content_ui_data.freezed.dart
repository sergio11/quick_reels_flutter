// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_content_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscoverContentUiState {
  bool get isShowUsers => throw _privateConstructorUsedError;
  bool get allowUserInput => throw _privateConstructorUsedError;
  String get authUserUuid => throw _privateConstructorUsedError;
  List<UserBO> get users => throw _privateConstructorUsedError;
  List<ReelBO> get reels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoverContentUiStateCopyWith<DiscoverContentUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverContentUiStateCopyWith<$Res> {
  factory $DiscoverContentUiStateCopyWith(DiscoverContentUiState value,
          $Res Function(DiscoverContentUiState) then) =
      _$DiscoverContentUiStateCopyWithImpl<$Res, DiscoverContentUiState>;
  @useResult
  $Res call(
      {bool isShowUsers,
      bool allowUserInput,
      String authUserUuid,
      List<UserBO> users,
      List<ReelBO> reels});
}

/// @nodoc
class _$DiscoverContentUiStateCopyWithImpl<$Res,
        $Val extends DiscoverContentUiState>
    implements $DiscoverContentUiStateCopyWith<$Res> {
  _$DiscoverContentUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowUsers = null,
    Object? allowUserInput = null,
    Object? authUserUuid = null,
    Object? users = null,
    Object? reels = null,
  }) {
    return _then(_value.copyWith(
      isShowUsers: null == isShowUsers
          ? _value.isShowUsers
          : isShowUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      allowUserInput: null == allowUserInput
          ? _value.allowUserInput
          : allowUserInput // ignore: cast_nullable_to_non_nullable
              as bool,
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      reels: null == reels
          ? _value.reels
          : reels // ignore: cast_nullable_to_non_nullable
              as List<ReelBO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscoverContentUiStateImplCopyWith<$Res>
    implements $DiscoverContentUiStateCopyWith<$Res> {
  factory _$$DiscoverContentUiStateImplCopyWith(
          _$DiscoverContentUiStateImpl value,
          $Res Function(_$DiscoverContentUiStateImpl) then) =
      __$$DiscoverContentUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isShowUsers,
      bool allowUserInput,
      String authUserUuid,
      List<UserBO> users,
      List<ReelBO> reels});
}

/// @nodoc
class __$$DiscoverContentUiStateImplCopyWithImpl<$Res>
    extends _$DiscoverContentUiStateCopyWithImpl<$Res,
        _$DiscoverContentUiStateImpl>
    implements _$$DiscoverContentUiStateImplCopyWith<$Res> {
  __$$DiscoverContentUiStateImplCopyWithImpl(
      _$DiscoverContentUiStateImpl _value,
      $Res Function(_$DiscoverContentUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowUsers = null,
    Object? allowUserInput = null,
    Object? authUserUuid = null,
    Object? users = null,
    Object? reels = null,
  }) {
    return _then(_$DiscoverContentUiStateImpl(
      isShowUsers: null == isShowUsers
          ? _value.isShowUsers
          : isShowUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      allowUserInput: null == allowUserInput
          ? _value.allowUserInput
          : allowUserInput // ignore: cast_nullable_to_non_nullable
              as bool,
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      reels: null == reels
          ? _value._reels
          : reels // ignore: cast_nullable_to_non_nullable
              as List<ReelBO>,
    ));
  }
}

/// @nodoc

class _$DiscoverContentUiStateImpl implements _DiscoverContentUiState {
  const _$DiscoverContentUiStateImpl(
      {this.isShowUsers = false,
      this.allowUserInput = true,
      this.authUserUuid = "",
      final List<UserBO> users = const [],
      final List<ReelBO> reels = const []})
      : _users = users,
        _reels = reels;

  @override
  @JsonKey()
  final bool isShowUsers;
  @override
  @JsonKey()
  final bool allowUserInput;
  @override
  @JsonKey()
  final String authUserUuid;
  final List<UserBO> _users;
  @override
  @JsonKey()
  List<UserBO> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<ReelBO> _reels;
  @override
  @JsonKey()
  List<ReelBO> get reels {
    if (_reels is EqualUnmodifiableListView) return _reels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reels);
  }

  @override
  String toString() {
    return 'DiscoverContentUiState(isShowUsers: $isShowUsers, allowUserInput: $allowUserInput, authUserUuid: $authUserUuid, users: $users, reels: $reels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverContentUiStateImpl &&
            (identical(other.isShowUsers, isShowUsers) ||
                other.isShowUsers == isShowUsers) &&
            (identical(other.allowUserInput, allowUserInput) ||
                other.allowUserInput == allowUserInput) &&
            (identical(other.authUserUuid, authUserUuid) ||
                other.authUserUuid == authUserUuid) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._reels, _reels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isShowUsers,
      allowUserInput,
      authUserUuid,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_reels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverContentUiStateImplCopyWith<_$DiscoverContentUiStateImpl>
      get copyWith => __$$DiscoverContentUiStateImplCopyWithImpl<
          _$DiscoverContentUiStateImpl>(this, _$identity);
}

abstract class _DiscoverContentUiState implements DiscoverContentUiState {
  const factory _DiscoverContentUiState(
      {final bool isShowUsers,
      final bool allowUserInput,
      final String authUserUuid,
      final List<UserBO> users,
      final List<ReelBO> reels}) = _$DiscoverContentUiStateImpl;

  @override
  bool get isShowUsers;
  @override
  bool get allowUserInput;
  @override
  String get authUserUuid;
  @override
  List<UserBO> get users;
  @override
  List<ReelBO> get reels;
  @override
  @JsonKey(ignore: true)
  _$$DiscoverContentUiStateImplCopyWith<_$DiscoverContentUiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
