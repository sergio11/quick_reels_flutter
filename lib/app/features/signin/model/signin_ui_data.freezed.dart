// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInUiData {
  bool get isSignInSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInUiDataCopyWith<SignInUiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInUiDataCopyWith<$Res> {
  factory $SignInUiDataCopyWith(
          SignInUiData value, $Res Function(SignInUiData) then) =
      _$SignInUiDataCopyWithImpl<$Res, SignInUiData>;
  @useResult
  $Res call({bool isSignInSuccess});
}

/// @nodoc
class _$SignInUiDataCopyWithImpl<$Res, $Val extends SignInUiData>
    implements $SignInUiDataCopyWith<$Res> {
  _$SignInUiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignInSuccess = null,
  }) {
    return _then(_value.copyWith(
      isSignInSuccess: null == isSignInSuccess
          ? _value.isSignInSuccess
          : isSignInSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInUiDataImplCopyWith<$Res>
    implements $SignInUiDataCopyWith<$Res> {
  factory _$$SignInUiDataImplCopyWith(
          _$SignInUiDataImpl value, $Res Function(_$SignInUiDataImpl) then) =
      __$$SignInUiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSignInSuccess});
}

/// @nodoc
class __$$SignInUiDataImplCopyWithImpl<$Res>
    extends _$SignInUiDataCopyWithImpl<$Res, _$SignInUiDataImpl>
    implements _$$SignInUiDataImplCopyWith<$Res> {
  __$$SignInUiDataImplCopyWithImpl(
      _$SignInUiDataImpl _value, $Res Function(_$SignInUiDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignInSuccess = null,
  }) {
    return _then(_$SignInUiDataImpl(
      isSignInSuccess: null == isSignInSuccess
          ? _value.isSignInSuccess
          : isSignInSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignInUiDataImpl implements _SignInUiData {
  const _$SignInUiDataImpl({this.isSignInSuccess = false});

  @override
  @JsonKey()
  final bool isSignInSuccess;

  @override
  String toString() {
    return 'SignInUiData(isSignInSuccess: $isSignInSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInUiDataImpl &&
            (identical(other.isSignInSuccess, isSignInSuccess) ||
                other.isSignInSuccess == isSignInSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignInSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInUiDataImplCopyWith<_$SignInUiDataImpl> get copyWith =>
      __$$SignInUiDataImplCopyWithImpl<_$SignInUiDataImpl>(this, _$identity);
}

abstract class _SignInUiData implements SignInUiData {
  const factory _SignInUiData({final bool isSignInSuccess}) =
      _$SignInUiDataImpl;

  @override
  bool get isSignInSuccess;
  @override
  @JsonKey(ignore: true)
  _$$SignInUiDataImplCopyWith<_$SignInUiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
