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
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

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
  $Res call({bool isLoading, String? errorMessage});
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
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInUiDataCopyWith<$Res>
    implements $SignInUiDataCopyWith<$Res> {
  factory _$$_SignInUiDataCopyWith(
          _$_SignInUiData value, $Res Function(_$_SignInUiData) then) =
      __$$_SignInUiDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$_SignInUiDataCopyWithImpl<$Res>
    extends _$SignInUiDataCopyWithImpl<$Res, _$_SignInUiData>
    implements _$$_SignInUiDataCopyWith<$Res> {
  __$$_SignInUiDataCopyWithImpl(
      _$_SignInUiData _value, $Res Function(_$_SignInUiData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SignInUiData(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SignInUiData implements _SignInUiData {
  const _$_SignInUiData({this.isLoading = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SignInUiData(isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInUiData &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInUiDataCopyWith<_$_SignInUiData> get copyWith =>
      __$$_SignInUiDataCopyWithImpl<_$_SignInUiData>(this, _$identity);
}

abstract class _SignInUiData implements SignInUiData {
  const factory _SignInUiData(
      {final bool isLoading, final String? errorMessage}) = _$_SignInUiData;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SignInUiDataCopyWith<_$_SignInUiData> get copyWith =>
      throw _privateConstructorUsedError;
}
