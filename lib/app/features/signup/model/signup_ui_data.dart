import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_ui_data.freezed.dart';

@freezed
class SignUpUiData with _$SignUpUiData {
  const factory SignUpUiData({
    final File? pickedImage,
    final Uint8List? pickedImageData
  }) = _SignUpUiData;
}