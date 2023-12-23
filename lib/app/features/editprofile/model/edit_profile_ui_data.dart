import 'dart:io';
import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_ui_data.freezed.dart';

@freezed
class EditProfileUiState with _$EditProfileUiState {
  const factory EditProfileUiState({
    @Default("") final String userUid,
    @Default("") final String username,
    @Default("") final String email,
    @Default("") final String bio,
    @Default("") final String photoUrl,
    final Uint8List? pickedImageData
  }) = _EditProfileUiState;
}