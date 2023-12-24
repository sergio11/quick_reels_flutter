import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_reel_ui_data.freezed.dart';

@freezed
class UploadReelUiState with _$UploadReelUiState {
  const factory UploadReelUiState({final String? videoFilePath}) =
      _UploadReelUiState;
}
