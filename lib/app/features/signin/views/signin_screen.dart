import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/textfield_validation.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/common_button.dart';
import 'package:quickreels/app/core/widget/common_onboarding_container.dart';
import 'package:quickreels/app/core/widget/text_field_input.dart';
import 'package:quickreels/app/features/signin/controllers/signin_controller.dart';
import 'package:quickreels/app/features/signin/model/signin_ui_data.dart';

class SignInScreen extends BaseView<SignInController, SignInUiData> {

  final VoidCallback onSignInSuccess;
  final VoidCallback onGoToSignUp;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({required this.onSignInSuccess, required this.onGoToSignUp});

  void onLoginClicked() async {
    hideKeyboard(context);
    if (_formKey.currentState?.validate() == true) {
      controller.loginUser(
        _emailController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget body(BuildContext context, SignInUiData uiData) {
    if(uiData.isSignInSuccess) {
      onSignInSuccess();
    }
    return Stack(
      children: _buildScreenStack(context),
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
        _buildMainLogo(),
        _buildTitleScreen(context),
        _buildSignInForm(context),
        _buildSignUpRow(context),
      ],
    );
  }

  Widget _buildMainLogo() {
    return SvgPicture.asset(
      'assets/images/main_logo.svg',
      color: AppColors.colorWhite,
      height: 80,
    );
  }

  Widget _buildTitleScreen(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Explore a boundless world of movies and shows, personalized for you.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
            .labelLarge
                ?.copyWith(color: AppColors.colorWhite, fontWeight: FontWeight.w300)),
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