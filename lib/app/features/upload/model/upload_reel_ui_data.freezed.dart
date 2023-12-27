// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_reel_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UploadReelUiState {
  String? get videoFilePath => throw _privateConstructorUsedError;
  Uint8List? get videoImageData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadReelUiStateCopyWith<UploadReelUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadReelUiStateCopyWith<$Res> {
  factory $UploadReelUiStateCopyWith(
          UploadReelUiState value, $Res Function(UploadReelUiState) then) =
      _$UploadReelUiStateCopyWithImpl<$Res, UploadReelUiState>;
  @useResult
  $Res call({String? videoFilePath, Uint8List? videoImageData});
}

/// @nodoc
class _$UploadReelUiStateCopyWithImpl<$Res, $Val extends UploadReelUiState>
    implements $UploadReelUiStateCopyWith<$Res> {
  _$UploadReelUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoFilePath = freezed,
    Object? videoImageData = freezed,
  }) {
    return _then(_value.copyWith(
      videoFilePath: freezed == videoFilePath
          ? _value.videoFilePath
          : videoFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      videoImageData: freezed == videoImageData
          ? _value.videoImageData
          : videoImageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadReelUiStateImplCopyWith<$Res>
    implements $UploadReelUiStateCopyWith<$Res> {
  factory _$$UploadReelUiStateImplCopyWith(_$UploadReelUiStateImpl value,
          $Res Function(_$UploadReelUiStateImpl) then) =
      __$$UploadReelUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? videoFilePath, Uint8List? videoImageData});
}

/// @nodoc
class __$$UploadReelUiStateImplCopyWithImpl<$Res>
    extends _$UploadReelUiStateCopyWithImpl<$Res, _$UploadReelUiStateImpl>
    implements _$$UploadReelUiStateImplCopyWith<$Res> {
  __$$UploadReelUiStateImplCopyWithImpl(_$UploadReelUiStateImpl _value,
      $Res Function(_$UploadReelUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoFilePath = freezed,
    Object? videoImageData = freezed,
  }) {
    return _then(_$UploadReelUiStateImpl(
      videoFilePath: freezed == videoFilePath
          ? _value.videoFilePath
          : videoFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      videoImageData: freezed == videoImageData
          ? _value.videoImageData
          : videoImageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$UploadReelUiStateImpl implements _UploadReelUiState {
  const _$UploadReelUiStateImpl({this.videoFilePath, this.videoImageData});

  @override
  final String? videoFilePath;
  @override
  final Uint8List? videoImageData;

  @override
  String toString() {
    return 'UploadReelUiState(videoFilePath: $videoFilePath, videoImageData: $videoImageData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadReelUiStateImpl &&
            (identical(other.videoFilePath, videoFilePath) ||
                other.videoFilePath == videoFilePath) &&
            const DeepCollectionEquality()
                .equals(other.videoImageData, videoImageData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoFilePath,
      const DeepCollectionEquality().hash(videoImageData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadReelUiStateImplCopyWith<_$UploadReelUiStateImpl> get copyWith =>
      __$$UploadReelUiStateImplCopyWithImpl<_$UploadReelUiStateImpl>(
          this, _$identity);
}

abstract class _UploadReelUiState implements UploadReelUiState {
  const factory _UploadReelUiState(
      {final String? videoFilePath,
      final Uint8List? videoImageData}) = _$UploadReelUiStateImpl;

  @override
  String? get videoFilePath;
  @override
  Uint8List? get videoImageData;
  @override
  @JsonKey(ignore: true)
  _$$UploadReelUiStateImplCopyWith<_$UploadReelUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
