// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeUiData {
  String get authUserUuid => throw _privateConstructorUsedError;
  List<ReelBO> get reels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeUiDataCopyWith<HomeUiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUiDataCopyWith<$Res> {
  factory $HomeUiDataCopyWith(
          HomeUiData value, $Res Function(HomeUiData) then) =
      _$HomeUiDataCopyWithImpl<$Res, HomeUiData>;
  @useResult
  $Res call({String authUserUuid, List<ReelBO> reels});
}

/// @nodoc
class _$HomeUiDataCopyWithImpl<$Res, $Val extends HomeUiData>
    implements $HomeUiDataCopyWith<$Res> {
  _$HomeUiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUserUuid = null,
    Object? reels = null,
  }) {
    return _then(_value.copyWith(
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
      reels: null == reels
          ? _value.reels
          : reels // ignore: cast_nullable_to_non_nullable
              as List<ReelBO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeUiDataImplCopyWith<$Res>
    implements $HomeUiDataCopyWith<$Res> {
  factory _$$HomeUiDataImplCopyWith(
          _$HomeUiDataImpl value, $Res Function(_$HomeUiDataImpl) then) =
      __$$HomeUiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authUserUuid, List<ReelBO> reels});
}

/// @nodoc
class __$$HomeUiDataImplCopyWithImpl<$Res>
    extends _$HomeUiDataCopyWithImpl<$Res, _$HomeUiDataImpl>
    implements _$$HomeUiDataImplCopyWith<$Res> {
  __$$HomeUiDataImplCopyWithImpl(
      _$HomeUiDataImpl _value, $Res Function(_$HomeUiDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUserUuid = null,
    Object? reels = null,
  }) {
    return _then(_$HomeUiDataImpl(
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
      reels: null == reels
          ? _value._reels
          : reels // ignore: cast_nullable_to_non_nullable
              as List<ReelBO>,
    ));
  }
}

/// @nodoc

class _$HomeUiDataImpl implements _HomeUiData {
  const _$HomeUiDataImpl(
      {this.authUserUuid = "", final List<ReelBO> reels = const []})
      : _reels = reels;

  @override
  @JsonKey()
  final String authUserUuid;
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
    return 'HomeUiData(authUserUuid: $authUserUuid, reels: $reels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeUiDataImpl &&
            (identical(other.authUserUuid, authUserUuid) ||
                other.authUserUuid == authUserUuid) &&
            const DeepCollectionEquality().equals(other._reels, _reels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, authUserUuid, const DeepCollectionEquality().hash(_reels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeUiDataImplCopyWith<_$HomeUiDataImpl> get copyWith =>
      __$$HomeUiDataImplCopyWithImpl<_$HomeUiDataImpl>(this, _$identity);
}

abstract class _HomeUiData implements HomeUiData {
  const factory _HomeUiData(
      {final String authUserUuid, final List<ReelBO> reels}) = _$HomeUiDataImpl;

  @override
  String get authUserUuid;
  @override
  List<ReelBO> get reels;
  @override
  @JsonKey(ignore: true)
  _$$HomeUiDataImplCopyWith<_$HomeUiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
