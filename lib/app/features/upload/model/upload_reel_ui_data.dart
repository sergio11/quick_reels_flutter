import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickreels/app/domain/model/place_details.dart';

part 'upload_reel_ui_data.freezed.dart';

@freezed
class UploadReelUiState with _$UploadReelUiState {
  const factory UploadReelUiState({
    final String? videoFilePath,
    final PlaceDetailsBO? placeDetails
  }) = _UploadReelUiState;
}