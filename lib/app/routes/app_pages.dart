import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/features/home/views/home_screen.dart';
import 'package:quickreels/app/features/onboarding/onboarding_screen.dart';
import 'package:quickreels/app/features/signin/bindings/signin_binding.dart';
import 'package:quickreels/app/features/signin/views/signin_screen.dart';
import 'package:quickreels/app/features/signup/bindings/signup_binding.dart';
import 'package:quickreels/app/features/signup/views/signup_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
        name: _Paths.ONBOARDING,
        page: () => OnBoardingScreen(
            onSignInPressed: () => Get.toNamed(Routes.SIGN_IN),
            onSignUpPressed: () => Get.toNamed(Routes.SIGN_UP))),
    GetPage(
        name: _Paths.SIGN_IN,
        page: () => SignInScreen(
            onSignInSuccess: () => Get.offAllNamed(Routes.HOME),
            onGoToSignUp: () => Get.toNamed(Routes.SIGN_UP)),
        binding: SignInBinding(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignupScreen(
        onGoToSignIn: () => Get.offNamed(Routes.SIGN_IN),
      ),
      binding: SignupBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
    )
  ];
}
