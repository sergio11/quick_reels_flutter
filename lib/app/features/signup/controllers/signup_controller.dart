import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/domain/usecase/sign_up_user_use_case.dart';
import 'package:quickreels/app/features/signup/model/signup_ui_data.dart';

class SignupController extends BaseController<SignUpUiData> {

  final SignUpUserUseCase signUpUserUseCase;

  SignupController({ required this.signUpUserUseCase }): super(initialUiState: const SignUpUiData());

  void pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final pickedFileImage = File(pickedImage.path);
      final pickedFileImageData = pickedFileImage.readAsBytesSync();
      updateState(uiData.copyWith(pickedImage: pickedFileImage, pickedImageData: pickedFileImageData));
      showSuccessMessage('You have successfully selected your profile picture!');
    } else {
      showErrorMessage('An error occurred while picking the picture');
    }
  }

  // registering the user
  void registerUser(
      String username, String email, String password, String repeatPassword) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          repeatPassword.isNotEmpty &&
          uiData.pickedImageData != null) {
        callUseCase(
            signUpUserUseCase(SignUpParams(email, password, username, "", uiData.pickedImageData!)),
            onComplete: (isSuccess) => _handleSignUpCompleted(isSuccess)
        );
      } else {
        showErrorMessage('Please enter all the fields');
      }
    } catch (e) {
      showErrorMessage('An error occurred while creating the account');
    }
  }

  void _handleSignUpCompleted(bool isSuccess) {
    updateState(SignUpUiData(isSignUpSuccess: isSuccess));
  }
}