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
  Iterable<SongBO> get songs => throw _privateConstructorUsedError;
  String? get videoFilePath => throw _privateConstructorUsedError;
  Uint8List? get videoFileData => throw _privateConstructorUsedError;

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
  $Res call(
      {Iterable<SongBO> songs,
      String? videoFilePath,
      Uint8List? videoFileData});
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
    Object? songs = null,
    Object? videoFilePath = freezed,
    Object? videoFileData = freezed,
  }) {
    return _then(_value.copyWith(
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as Iterable<SongBO>,
      videoFilePath: freezed == videoFilePath
          ? _value.videoFilePath
          : videoFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      videoFileData: freezed == videoFileData
          ? _value.videoFileData
          : videoFileData // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {Iterable<SongBO> songs,
      String? videoFilePath,
      Uint8List? videoFileData});
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
    Object? songs = null,
    Object? videoFilePath = freezed,
    Object? videoFileData = freezed,
  }) {
    return _then(_$UploadReelUiStateImpl(
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as Iterable<SongBO>,
      videoFilePath: freezed == videoFilePath
          ? _value.videoFilePath
          : videoFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      videoFileData: freezed == videoFileData
          ? _value.videoFileData
          : videoFileData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$UploadReelUiStateImpl implements _UploadReelUiState {
  const _$UploadReelUiStateImpl(
      {this.songs = const [], this.videoFilePath, this.videoFileData});

  @override
  @JsonKey()
  final Iterable<SongBO> songs;
  @override
  final String? videoFilePath;
  @override
  final Uint8List? videoFileData;

  @override
  String toString() {
    return 'UploadReelUiState(songs: $songs, videoFilePath: $videoFilePath, videoFileData: $videoFileData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadReelUiStateImpl &&
            const DeepCollectionEquality().equals(other.songs, songs) &&
            (identical(other.videoFilePath, videoFilePath) ||
                other.videoFilePath == videoFilePath) &&
            const DeepCollectionEquality()
                .equals(other.videoFileData, videoFileData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(songs),
      videoFilePath,
      const DeepCollectionEquality().hash(videoFileData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadReelUiStateImplCopyWith<_$UploadReelUiStateImpl> get copyWith =>
      __$$UploadReelUiStateImplCopyWithImpl<_$UploadReelUiStateImpl>(
          this, _$identity);
}

abstract class _UploadReelUiState implements UploadReelUiState {
  const factory _UploadReelUiState(
      {final Iterable<SongBO> songs,
      final String? videoFilePath,
      final Uint8List? videoFileData}) = _$UploadReelUiStateImpl;

  @override
  Iterable<SongBO> get songs;
  @override
  String? get videoFilePath;
  @override
  Uint8List? get videoFileData;
  @override
  @JsonKey(ignore: true)
  _$$UploadReelUiStateImplCopyWith<_$UploadReelUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
