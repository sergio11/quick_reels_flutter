import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/textfield_validation.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/common_button.dart';
import 'package:quickreels/app/core/widget/common_onboarding_container.dart';
import 'package:quickreels/app/core/widget/text_field_input.dart';
import 'package:quickreels/app/features/signin/controllers/signin_controller.dart';

class SignInScreen extends BaseView<SignInController> {

  final VoidCallback onSignInSuccess;
  final VoidCallback onGoToSignUp;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({required this.onSignInSuccess, required this.onGoToSignUp});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  void onLoginClicked() async {
    if (_formKey.currentState?.validate() == true) {
      controller.loginUser(
        _emailController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _buildScreenStack(context),
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
        _buildTitleScreen(context),
        _buildSignInForm(context),
        _buildSignUpRow(context),
      ],
    );
  }

  Widget _buildTitleScreen(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("QuickReels - Instant Access to Limitless Entertainment",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: AppColors.colorWhite, fontWeight: FontWeight.w400)),
      ],
    );
  }

  Widget _buildSignInForm(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildEmailTextInput(),
            _buildPasswordTextInput(),
            const SizedBox(
              height: 25,
            ),
            _buildSignInButton()
          ],
        ));
  }

  Widget _buildScreenBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sign_in_background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildEmailTextInput() {
    return TextFieldInput(
      hintText: "Email",
      icon: const Icon(
        Icons.mail,
        size: 16,
      ),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
      onValidate: (value) =>
      value != null && value.isNotEmpty && value.isValidEmail(),
      errorText: "Email",
    );
  }

  Widget _buildPasswordTextInput() {
    return TextFieldInput(
      hintText: "Password",
      icon: const Icon(
        Icons.password,
        size: 16,
      ),
      textInputType: TextInputType.text,
      textEditingController: _passwordController,
      isPass: true,
      onValidate: (value) =>
      value != null && value.isNotEmpty && value.isValidPassword(),
      errorText: "Password",
    );
  }

  Widget _buildSignInButton() {
    return CommonButton(
      text: 'Login',
      textColor: AppColors.colorWhite,
      borderColor: AppColors.colorWhite,
      onPressed: onLoginClicked,
      styleType: CommonButtonStyleType.reverse,
      sizeType: CommonButtonSizeType.large,
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account? ',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.colorWhite)),
        GestureDetector(
          onTap: onGoToSignUp,
          child: Text(
            'Sign Up',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.colorWhite),
          ),
        ),
      ],
    );
  }
}