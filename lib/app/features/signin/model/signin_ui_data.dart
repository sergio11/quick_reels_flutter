import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_ui_data.freezed.dart';

@freezed
class SignInUiData with _$SignInUiData {
  const factory SignInUiData({
    @Default(false) final bool isSignInSuccess,
  }) = _SignInUiData;
}