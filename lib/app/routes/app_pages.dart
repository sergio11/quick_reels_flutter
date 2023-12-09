import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/features/home/views/home_screen.dart';
import 'package:quickreels/app/features/onboarding/onboarding_screen.dart';
import 'package:quickreels/app/features/profile/views/profile_screen.dart';
import 'package:quickreels/app/features/signin/bindings/signin_binding.dart';
import 'package:quickreels/app/features/signin/views/signin_screen.dart';
import 'package:quickreels/app/features/signup/bindings/signup_binding.dart';
import 'package:quickreels/app/features/signup/views/signup_screen.dart';
import 'package:quickreels/app/routes/middleware/auth_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final unrestrictedRoutes = [
    _Paths.ONBOARDING,
    _Paths.SIGN_IN,
    _Paths.SIGN_UP
  ];

  static final routes = [
    GetPage(
        name: _Paths.ONBOARDING,
        page: () => OnBoardingScreen(
            onSignInPressed: () => Get.toNamed(Routes.SIGN_IN),
            onSignUpPressed: () => Get.toNamed(Routes.SIGN_UP)),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.SIGN_IN,
        page: () => SignInScreen(
            onSignInSuccess: () => Get.offAllNamed(Routes.HOME),
            onGoToSignUp: () => Get.toNamed(Routes.SIGN_UP)),
        binding: SignInBinding(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 500),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.SIGN_UP,
        page: () => SignupScreen(
              onGoToSignIn: () => Get.offNamed(Routes.SIGN_IN),
              onSignUpSuccess: () => Get.offAllNamed(Routes.HOME),
            ),
        binding: SignupBinding(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 500),
        middlewares: [AuthMiddleware()]),
    GetPage(name: _Paths.HOME, page: () => const HomeScreen(), children: [
      GetPage(
          name: _Paths.PROFILE,
          page: () => ProfileScreen(),
          transition: Transition.downToUp,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400))
    ], middlewares: [
      AuthMiddleware()
    ]),
  ];
}
