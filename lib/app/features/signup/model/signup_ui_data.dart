import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_ui_data.freezed.dart';

@freezed
class SignUpUiData with _$SignUpUiData {
  const factory SignUpUiData({
    final File? pickedImage
  }) = _SignUpUiData;
}