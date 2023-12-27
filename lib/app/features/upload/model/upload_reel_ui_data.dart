import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickreels/app/domain/model/song.dart';

part 'upload_reel_ui_data.freezed.dart';

@freezed
class UploadReelUiState with _$UploadReelUiState {
  const factory UploadReelUiState({
    @Default([]) final Iterable<SongBO> songs,
    final String? videoFilePath,
    final Uint8List? videoFileData
  }) =
      _UploadReelUiState;
}
