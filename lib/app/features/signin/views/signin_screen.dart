import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/common_onboarding_container.dart';
import 'package:quickreels/app/core/widget/text_input_field.dart';
import 'package:quickreels/app/features/signin/controllers/signin_controller.dart';

class SignInScreen extends BaseView<SignInController> {

  final VoidCallback onSignInSuccess;
  final VoidCallback onGoToSignUp;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({required this.onSignInSuccess, required this.onGoToSignUp});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
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
        Text(
          'Quick Reels',
          style: TextStyle(
            fontSize: 35,
            color: AppColors.buttonColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Text(
          'Login',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 25,),
        _buildEmailTextInput(context),
        const SizedBox(height: 25,),
        _buildPasswordTextInput(context),
        const SizedBox(
          height: 30,
        ),
        _buildSignInButton(context),
        const SizedBox(height: 15,),
        _buildBottomSection(context),
      ],
    );
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

  Widget _buildEmailTextInput(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextInputField(
        controller: _emailController,
        labelText: 'Email',
        icon: Icons.email,
      ),
    );
  }

  Widget _buildPasswordTextInput(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextInputField(
        controller: _passwordController,
        labelText: 'Password',
        icon: Icons.lock,
        isObscure: true,
      ),
    );
  }

  Widget _buildSignInButton(context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width - 40,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: InkWell(
        onTap: () =>
            controller.loginUser(
              _emailController.text,
              _passwordController.text,
            ),
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account? ',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        InkWell(
          onTap: onGoToSignUp,
          child: Text(
            'Register',
            style: TextStyle(fontSize: 20, color: AppColors.buttonColor),
          ),
        ),
      ],
    );
  }

}