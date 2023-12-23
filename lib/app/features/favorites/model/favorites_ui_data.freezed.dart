// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritesUiState {
  List<ReelBO> get reels => throw _privateConstructorUsedError;
  String get userUuid => throw _privateConstructorUsedError;
  String get authUserUuid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesUiStateCopyWith<FavoritesUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesUiStateCopyWith<$Res> {
  factory $FavoritesUiStateCopyWith(
          FavoritesUiState value, $Res Function(FavoritesUiState) then) =
      _$FavoritesUiStateCopyWithImpl<$Res, FavoritesUiState>;
  @useResult
  $Res call({List<ReelBO> reels, String userUuid, String authUserUuid});
}

/// @nodoc
class _$FavoritesUiStateCopyWithImpl<$Res, $Val extends FavoritesUiState>
    implements $FavoritesUiStateCopyWith<$Res> {
  _$FavoritesUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reels = null,
    Object? userUuid = null,
    Object? authUserUuid = null,
  }) {
    return _then(_value.copyWith(
      reels: null == reels
          ? _value.reels
          : reels // ignore: cast_nullable_to_non_nullable
              as List<ReelBO>,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritesUiStateImplCopyWith<$Res>
    implements $FavoritesUiStateCopyWith<$Res> {
  factory _$$FavoritesUiStateImplCopyWith(_$FavoritesUiStateImpl value,
          $Res Function(_$FavoritesUiStateImpl) then) =
      __$$FavoritesUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReelBO> reels, String userUuid, String authUserUuid});
}

/// @nodoc
class __$$FavoritesUiStateImplCopyWithImpl<$Res>
    extends _$FavoritesUiStateCopyWithImpl<$Res, _$FavoritesUiStateImpl>
    implements _$$FavoritesUiStateImplCopyWith<$Res> {
  __$$FavoritesUiStateImplCopyWithImpl(_$FavoritesUiStateImpl _value,
      $Res Function(_$FavoritesUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reels = null,
    Object? userUuid = null,
    Object? authUserUuid = null,
  }) {
    return _then(_$FavoritesUiStateImpl(
      reels: null == reels
          ? _value._reels
          : reels // ignore: cast_nullable_to_non_nullable
              as List<ReelBO>,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoritesUiStateImpl implements _FavoritesUiState {
  const _$FavoritesUiStateImpl(
      {final List<ReelBO> reels = const [],
      this.userUuid = "",
      this.authUserUuid = ""})
      : _reels = reels;

  final List<ReelBO> _reels;
  @override
  @JsonKey()
  List<ReelBO> get reels {
    if (_reels is EqualUnmodifiableListView) return _reels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reels);
  }

  @override
  @JsonKey()
  final String userUuid;
  @override
  @JsonKey()
  final String authUserUuid;

  @override
  String toString() {
    return 'FavoritesUiState(reels: $reels, userUuid: $userUuid, authUserUuid: $authUserUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesUiStateImpl &&
            const DeepCollectionEquality().equals(other._reels, _reels) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            (identical(other.authUserUuid, authUserUuid) ||
                other.authUserUuid == authUserUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_reels), userUuid, authUserUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesUiStateImplCopyWith<_$FavoritesUiStateImpl> get copyWith =>
      __$$FavoritesUiStateImplCopyWithImpl<_$FavoritesUiStateImpl>(
          this, _$identity);
}

abstract class _FavoritesUiState implements FavoritesUiState {
  const factory _FavoritesUiState(
      {final List<ReelBO> reels,
      final String userUuid,
      final String authUserUuid}) = _$FavoritesUiStateImpl;

  @override
  List<ReelBO> get reels;
  @override
  String get userUuid;
  @override
  String get authUserUuid;
  @override
  @JsonKey(ignore: true)
  _$$FavoritesUiStateImplCopyWith<_$FavoritesUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
