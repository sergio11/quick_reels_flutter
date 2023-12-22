import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/features/comments/bindings/comments_binding.dart';
import 'package:quickreels/app/features/comments/views/comments_screen.dart';
import 'package:quickreels/app/features/discover/bindings/discover_content_binding.dart';
import 'package:quickreels/app/features/discover/views/discover_content_screen.dart';
import 'package:quickreels/app/features/home/bindings/home_binding.dart';
import 'package:quickreels/app/features/home/views/home_screen.dart';
import 'package:quickreels/app/features/main/bindings/main_binding.dart';
import 'package:quickreels/app/features/main/views/main_screen.dart';
import 'package:quickreels/app/features/onboarding/onboarding_screen.dart';
import 'package:quickreels/app/features/profile/bindings/profile_binding.dart';
import 'package:quickreels/app/features/profile/views/profile_screen.dart';
import 'package:quickreels/app/features/signin/bindings/signin_binding.dart';
import 'package:quickreels/app/features/signin/views/signin_screen.dart';
import 'package:quickreels/app/features/signup/bindings/signup_binding.dart';
import 'package:quickreels/app/features/signup/views/signup_screen.dart';
import 'package:quickreels/app/routes/middleware/auth_middleware.dart';
import 'package:quickreels/app/routes/middleware/system_ui_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static const String USER_UUID_KEY = 'USER_UUID';
  static const String REEL_UUID_KEY = 'REEL_UUID_KEY';

  static final unrestrictedRoutes = [
    _Paths.ONBOARDING,
    _Paths.SIGN_IN,
    _Paths.SIGN_UP
  ];

  static final immersiveModeRoutes = [
    _Paths.ONBOARDING,
    _Paths.SIGN_IN,
    _Paths.SIGN_UP
  ];

  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnBoardingScreen(
        onSignInPressed: () => _navigateTo(Routes.SIGN_IN),
        onSignUpPressed: () => _navigateTo(Routes.SIGN_UP),
      ),
      middlewares: [AuthMiddleware(), SystemUiMiddleware()],
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInScreen(
        onSignInSuccess: () => _navigateTo(Routes.HOME),
        onGoToSignUp: () => _navigateTo(Routes.SIGN_UP),
      ),
      binding: SignInBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 500),
      middlewares: [AuthMiddleware(), SystemUiMiddleware()],
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignupScreen(
        onGoToSignIn: () => _navigateTo(Routes.SIGN_IN),
        onSignUpSuccess: () => _navigateTo(Routes.HOME),
      ),
      binding: SignupBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 500),
      middlewares: [AuthMiddleware(), SystemUiMiddleware()],
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => MainScreen(tabItems: [
        HomeScreen(
          onGoToComments: (reelUuid) => _navigateTo(
              _Paths.HOME + _Paths.COMMENTS,
              arguments: {REEL_UUID_KEY: reelUuid}),
          onGoToUserProfile: (userUuid) => _navigateTo(
              _Paths.HOME + _Paths.PROFILE,
              arguments: {USER_UUID_KEY: userUuid}),
        ),
        DiscoverContentScreen(
            onShowUserProfile: (userUuid) => _navigateTo(
                _Paths.HOME + _Paths.PROFILE,
                arguments: {USER_UUID_KEY: userUuid})),
        const Text("Add"),
        const Text("Favorites"),
        ProfileScreen()
      ]),
      binding: MainBinding(),
      bindings: [HomeBinding(), ProfileBinding(), DiscoverContentBinding()],
      children: [
        GetPage(
          name: _Paths.PROFILE,
          page: () => ProfileScreen(),
          transition: Transition.downToUp,
          binding: ProfileBinding(),
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.DISCOVER,
          page: () => DiscoverContentScreen(
              onShowUserProfile: (userUuid) => _navigateTo(
                  _Paths.HOME + _Paths.PROFILE,
                  arguments: {USER_UUID_KEY: userUuid})),
          transition: Transition.downToUp,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.COMMENTS,
          bindings: [CommentsBinding()],
          page: () => CommentsScreen(
              onBackPressed: () {
                Get.back();
              },
              onShowUserProfile: (userUuid) => _navigateTo(
                  _Paths.HOME + _Paths.PROFILE,
                  arguments: {USER_UUID_KEY: userUuid})),
          transition: Transition.leftToRight,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        )
      ],
      middlewares: [AuthMiddleware(), SystemUiMiddleware()],
    ),
  ];

  static void _navigateTo(String route, {Map<String, dynamic>? arguments}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.toNamed(route, arguments: arguments ?? {});
    });
  }
}
