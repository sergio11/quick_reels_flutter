import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/textfield_validation.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/avatar_input_selector.dart';
import 'package:quickreels/app/core/widget/common_button.dart';
import 'package:quickreels/app/core/widget/common_onboarding_container.dart';
import 'package:quickreels/app/core/widget/text_field_input.dart';
import 'package:quickreels/app/features/signup/controllers/signup_controller.dart';
import 'package:quickreels/app/features/signup/model/signup_ui_data.dart';

class SignupScreen extends BaseView<SignupController, SignUpUiData> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
  TextEditingController();

  final VoidCallback onGoToSignIn;

  SignupScreen({ required this.onGoToSignIn });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
   return null;
  }

  @override
  bool immersiveMode() => true;

  void onSignUpUser() async {
    if (_formKey.currentState?.validate() == true) {}
  }

  @override
  Widget body(BuildContext context, SignUpUiData uiData) {
    return Stack(
      children: _buildScreenStack(context),
    );
  }

  Widget _buildScreenBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sign_up_background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _buildScreenStack(BuildContext context) {
    final screenStack = [
      _buildScreenBackground(),
      _buildScreenContent(context)
    ];
    return screenStack;
  }

  Widget _buildScreenContent(BuildContext context) {
    return CommonOnBoardingContainer(
      children: [
        _buildAvatarInput(),
        _buildSignUpForm(),
        _buildNotAccountRow(context)
      ],
    );
  }


  Widget _buildAvatarInput() {
    return AvatarInputSelector(
      onPickUpImageFromGallery: () {},
      avatarImageData: null,
    );
  }

  Widget _buildSignUpForm() {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildUsernameTextInput(),
            _buildEmailTextInput(),
            _buildPasswordTextInput(),
            _buildRepeatPasswordTextInput(),
            const SizedBox(height: 24),
            _buildSignUpButton(),
          ],
        ));
  }

  Widget _buildUsernameTextInput() {
    return TextFieldInput(
        hintText: "Username",
        icon: const Icon(Icons.person, size: 16),
        textInputType: TextInputType.text,
        onValidate: (value) =>
        value != null && value.isNotEmpty && value.isValidName(),
        errorText: "Invalid username",
        textEditingController: _usernameController);
  }

  Widget _buildEmailTextInput() {
    return TextFieldInput(
      hintText: "Email",
      icon: const Icon(Icons.mail, size: 16),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
      onValidate: (value) =>
      value != null && value.isNotEmpty && value.isValidEmail(),
      errorText: "Invalid email",
    );
  }

  Widget _buildPasswordTextInput() {
    return TextFieldInput(
      hintText: "Password",
      icon: const Icon(Icons.password, size: 16),
      textInputType: TextInputType.text,
      textEditingController: _passwordController,
      onValidate: (value) =>
      value != null && value.isNotEmpty && value.isValidPassword(),
      errorText: "Invalid password",
      isPass: true,
    );
  }

  Widget _buildRepeatPasswordTextInput() {
    return TextFieldInput(
      hintText: "Repeat Password",
      icon: const Icon(Icons.password, size: 16),
      textInputType: TextInputType.text,
      textEditingController: _repeatPasswordController,
      onValidate: (value) =>
      value != null && value.isNotEmpty && _passwordController.value.text == value,
      errorText: "Password not match",
      isPass: true,
    );
  }

  Widget _buildSignUpButton() {
    return CommonButton(
      text: 'Sign Up',
      textColor: AppColors.colorWhite,
      borderColor: AppColors.colorWhite,
      onPressed: onSignUpUser,
      styleType: CommonButtonStyleType.reverse,
      sizeType: CommonButtonSizeType.large,
    );
  }

  Widget _buildNotAccountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.colorWhite)),
        GestureDetector(
          onTap: onGoToSignIn,
          child: Text(
            'Login',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.colorWhite, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}