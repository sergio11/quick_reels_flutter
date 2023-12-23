import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_user_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/update_user_use_case.dart';
import 'package:quickreels/app/features/editprofile/model/edit_profile_ui_data.dart';

class EditProfileController extends BaseController<EditProfileUiState> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final UpdateUserUseCase updateUserUseCase;

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController bioController;

  static const String USER_UUID_KEY = 'USER_UUID';

  EditProfileController(
      {required this.getAuthUserUidUseCase,
      required this.getUserDetailsUseCase,
      required this.updateUserUseCase})
      : super(initialUiState: const EditProfileUiState());

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    bioController = TextEditingController();
  }

  @override
  void onResumed() {
    super.onResumed();
    _loadContent();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.onClose();
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final pickedFileImage = File(pickedImage.path);
      final pickedFileImageData = pickedFileImage.readAsBytesSync();
      updateState(uiData.copyWith(pickedImageData: pickedFileImageData));
      showSuccessMessage(
          'You have successfully selected your profile picture!');
    } else {
      showErrorMessage('An error occurred while picking the picture');
    }
  }

  void updateProfile() async {
    callUseCase(
        updateUserUseCase(UpdateUserParams(
            uid: uiData.userUid,
            username: usernameController.text,
            email: emailController.text,
            file: uiData.pickedImageData,
            bio: bioController.text)),
        onSuccess: (userDetail) => _onLoadUserCompleted(userDetail));
  }

  void _loadContent() async {
    final args = Get.arguments;
    if (args is Map<String, dynamic>? && args != null) {
      if (args.containsKey(USER_UUID_KEY)) {
        String? userUuid = args[USER_UUID_KEY] as String?;
        if (userUuid != null) {
          _loadUserProfile(userUuid);
          return;
        }
      }
    }
    _loadUserProfile(null);
  }

  void _loadUserProfile(String? userUuid) async {
    final String authUserUid =
        await getAuthUserUidUseCase(const DefaultParams());
    callUseCase(
        getUserDetailsUseCase(GetUserDetailsParams(userUuid ?? authUserUid)),
        onSuccess: (userDetail) => _onLoadUserCompleted(userDetail));
  }

  void _onLoadUserCompleted(UserBO userDetail) {
    updateState(uiData.copyWith(
        photoUrl: userDetail.photoUrl,
        userUid: userDetail.uid,
        username: userDetail.username,
        email: userDetail.email,
        bio: userDetail.bio));
    usernameController.text = userDetail.username;
    emailController.text = userDetail.email;
    bioController.text = userDetail.bio;
  }
}
