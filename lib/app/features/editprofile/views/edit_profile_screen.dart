import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/textfield_validation.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/avatar_input_selector.dart';
import 'package:quickreels/app/core/widget/text_field_input.dart';
import 'package:quickreels/app/features/editprofile/controller/edit_profile_controller.dart';
import 'package:quickreels/app/features/editprofile/model/edit_profile_ui_data.dart';

class EditProfileScreen
    extends BaseView<EditProfileController, EditProfileUiState> {
  final _formKey = GlobalKey<FormState>();

  EditProfileScreen();

  @override
  PreferredSizeWidget? appBar(BuildContext context, EditProfileUiState uiData) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColors.colorWhite, //change your color here
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.save_outlined,
            color: AppColors.colorWhite,
          ),
          onPressed: _onUpdateProfileClicked,
        )
      ],
      backgroundColor: AppColors.backgroundColor,
      title: Text(appLocalization.editProfileScreenTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.colorWhite)),
      centerTitle: false,
    );
  }

  @override
  Widget body(BuildContext context, EditProfileUiState uiData) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(35),
            child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildAvatarInputSelector(uiData),
                      const SizedBox(
                        height: 50,
                      ),
                      _buildUsernameTextInput(uiData),
                      _buildEmailTextInput(uiData),
                      _buildBioTextInput(uiData)
                    ]))));
  }

  Widget _buildAvatarInputSelector(EditProfileUiState state) {
    return AvatarInputSelector(
      onPickUpImageFromGallery: () => controller.pickImage(),
      avatarImageData: state.pickedImageData,
      currentImageUrl: state.photoUrl,
    );
  }

  Widget _buildEmailTextInput(EditProfileUiState state) {
    return TextFieldInput(
      hintText: appLocalization.editProfileScreenEmailTextFieldHint,
      icon: const Icon(Icons.mail, size: 16),
      textInputType: TextInputType.emailAddress,
      textEditingController: controller.emailController,
      onValidate: (value) =>
          value != null && value.isNotEmpty && value.isValidEmail(),
      errorText: appLocalization.editProfileScreenEmailTextFieldError,
    );
  }

  Widget _buildUsernameTextInput(EditProfileUiState state) {
    return TextFieldInput(
        hintText: appLocalization.editProfileScreenUsernameTextFieldHint,
        icon: const Icon(Icons.person, size: 16),
        textInputType: TextInputType.text,
        onValidate: (value) =>
            value != null && value.isNotEmpty && value.isValidName(),
        errorText: appLocalization.signUpScreenUsernameFieldErrorText,
        textEditingController: controller.usernameController);
  }

  Widget _buildBioTextInput(EditProfileUiState state) {
    return TextFieldInput(
      hintText: appLocalization.editProfileScreenBioTextFieldHint,
      textInputType: TextInputType.multiline,
      maxLines: 5,
      textEditingController: controller.bioController,
    );
  }

  void _onUpdateProfileClicked() {
    if (_formKey.currentState?.validate() == true) {
      hideKeyboard(context);
      controller.updateProfile();
    }
  }
}
