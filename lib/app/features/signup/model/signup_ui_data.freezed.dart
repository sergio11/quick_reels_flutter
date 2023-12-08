// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpUiData {
  File? get pickedImage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpUiDataCopyWith<SignUpUiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpUiDataCopyWith<$Res> {
  factory $SignUpUiDataCopyWith(
          SignUpUiData value, $Res Function(SignUpUiData) then) =
      _$SignUpUiDataCopyWithImpl<$Res, SignUpUiData>;
  @useResult
  $Res call({File? pickedImage, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$SignUpUiDataCopyWithImpl<$Res, $Val extends SignUpUiData>
    implements $SignUpUiDataCopyWith<$Res> {
  _$SignUpUiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedImage = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      pickedImage: freezed == pickedImage
          ? _value.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as File?,
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
abstract class _$$_SignUpUiDataCopyWith<$Res>
    implements $SignUpUiDataCopyWith<$Res> {
  factory _$$_SignUpUiDataCopyWith(
          _$_SignUpUiData value, $Res Function(_$_SignUpUiData) then) =
      __$$_SignUpUiDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File? pickedImage, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$_SignUpUiDataCopyWithImpl<$Res>
    extends _$SignUpUiDataCopyWithImpl<$Res, _$_SignUpUiData>
    implements _$$_SignUpUiDataCopyWith<$Res> {
  __$$_SignUpUiDataCopyWithImpl(
      _$_SignUpUiData _value, $Res Function(_$_SignUpUiData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedImage = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SignUpUiData(
      pickedImage: freezed == pickedImage
          ? _value.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as File?,
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

class _$_SignUpUiData implements _SignUpUiData {
  const _$_SignUpUiData(
      {this.pickedImage, this.isLoading = false, this.errorMessage});

  @override
  final File? pickedImage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SignUpUiData(pickedImage: $pickedImage, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpUiData &&
            (identical(other.pickedImage, pickedImage) ||
                other.pickedImage == pickedImage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pickedImage, isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpUiDataCopyWith<_$_SignUpUiData> get copyWith =>
      __$$_SignUpUiDataCopyWithImpl<_$_SignUpUiData>(this, _$identity);
}

abstract class _SignUpUiData implements SignUpUiData {
  const factory _SignUpUiData(
      {final File? pickedImage,
      final bool isLoading,
      final String? errorMessage}) = _$_SignUpUiData;

  @override
  File? get pickedImage;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpUiDataCopyWith<_$_SignUpUiData> get copyWith =>
      throw _privateConstructorUsedError;
}
