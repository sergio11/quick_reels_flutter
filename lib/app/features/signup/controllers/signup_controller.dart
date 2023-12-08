import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/domain/usecase/sign_up_user_use_case.dart';
import 'package:quickreels/app/features/signup/model/signup_ui_data.dart';

class SignupController extends BaseController {

  final SignUpUserUseCase signUpUserUseCase;

  final Rx<SignUpUiData> _uiData = const SignUpUiData().obs;

  SignUpUiData get uiData => _uiData.value;

  SignupController({ required this.signUpUserUseCase });

  @override
  void onReady() {
    super.onReady();
  }

  void pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
    }
    _uiData.value = uiData.copyWith(pickedImage: File(pickedImage!.path));
  }

  // registering the user
  void registerUser(
      String username, String email, String password) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          uiData.pickedImage != null) {

        //await signUpUserUseCase(SignUpParams(email, password, username, "", image));

      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }
}