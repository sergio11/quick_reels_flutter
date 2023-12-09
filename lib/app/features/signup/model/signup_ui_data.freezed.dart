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
  $Res call({File? pickedImage});
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
  }) {
    return _then(_value.copyWith(
      pickedImage: freezed == pickedImage
          ? _value.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpUiDataImplCopyWith<$Res>
    implements $SignUpUiDataCopyWith<$Res> {
  factory _$$SignUpUiDataImplCopyWith(
          _$SignUpUiDataImpl value, $Res Function(_$SignUpUiDataImpl) then) =
      __$$SignUpUiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File? pickedImage});
}

/// @nodoc
class __$$SignUpUiDataImplCopyWithImpl<$Res>
    extends _$SignUpUiDataCopyWithImpl<$Res, _$SignUpUiDataImpl>
    implements _$$SignUpUiDataImplCopyWith<$Res> {
  __$$SignUpUiDataImplCopyWithImpl(
      _$SignUpUiDataImpl _value, $Res Function(_$SignUpUiDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedImage = freezed,
  }) {
    return _then(_$SignUpUiDataImpl(
      pickedImage: freezed == pickedImage
          ? _value.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$SignUpUiDataImpl implements _SignUpUiData {
  const _$SignUpUiDataImpl({this.pickedImage});

  @override
  final File? pickedImage;

  @override
  String toString() {
    return 'SignUpUiData(pickedImage: $pickedImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpUiDataImpl &&
            (identical(other.pickedImage, pickedImage) ||
                other.pickedImage == pickedImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpUiDataImplCopyWith<_$SignUpUiDataImpl> get copyWith =>
      __$$SignUpUiDataImplCopyWithImpl<_$SignUpUiDataImpl>(this, _$identity);
}

abstract class _SignUpUiData implements SignUpUiData {
  const factory _SignUpUiData({final File? pickedImage}) = _$SignUpUiDataImpl;

  @override
  File? get pickedImage;
  @override
  @JsonKey(ignore: true)
  _$$SignUpUiDataImplCopyWith<_$SignUpUiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
