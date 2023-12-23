import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/features/comments/bindings/comments_binding.dart';
import 'package:quickreels/app/features/comments/views/comments_screen.dart';
import 'package:quickreels/app/features/discover/bindings/discover_content_binding.dart';
import 'package:quickreels/app/features/discover/views/discover_content_screen.dart';
import 'package:quickreels/app/features/favorites/bindings/favorites_binding.dart';
import 'package:quickreels/app/features/favorites/views/favorites_screen.dart';
import 'package:quickreels/app/features/followers/bindings/folllowers_binding.dart';
import 'package:quickreels/app/features/followers/views/followers_screen.dart';
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
  static const String CONTENT_TYPE_KEY = 'CONTENT_TYPE';

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

  static void _navigateTo(String route, {Map<String, dynamic>? arguments}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.toNamed(route, arguments: arguments ?? {});
    });
  }

  static void _navigateToProfile(String userUid) {
    _navigateTo(_Paths.HOME + _Paths.PROFILE,
        arguments: {USER_UUID_KEY: userUid});
  }

  static void _navigateToFollowers(String userUid) {
    _navigateTo(_Paths.HOME + _Paths.FOLLOWERS,
        arguments: {USER_UUID_KEY: userUid, CONTENT_TYPE_KEY: "followers"});
  }

  static void _navigateToFollowing(String userUid) {
    _navigateTo(_Paths.HOME + _Paths.FOLLOWERS,
        arguments: {USER_UUID_KEY: userUid, CONTENT_TYPE_KEY: "following"});
  }

  static void _navigateToComments(String reelUuid) {
    _navigateTo(_Paths.HOME + _Paths.COMMENTS,
        arguments: {REEL_UUID_KEY: reelUuid});
  }

  static void _navigateToFavorites(String userUid) {
    _navigateTo(_Paths.HOME + _Paths.FAVORITES,
        arguments: {USER_UUID_KEY: userUid});
  }

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
          onGoToComments: (reelUuid) => _navigateToComments(reelUuid),
          onGoToUserProfile: (userUuid) => _navigateToProfile(userUuid),
        ),
        DiscoverContentScreen(
          onShowUserProfile: (userUuid) => _navigateToProfile(userUuid),
          onGoToComments: (String reelUuid) => _navigateToComments(reelUuid),
        ),
        const Text("Add"),
        FavoritesScreen(
          onGoToComments: (String reelUuid) => _navigateToComments(reelUuid),
          onShowUserProfile: (String userUid) => _navigateToProfile(userUid),
        ),
        ProfileScreen(
          onShowFollowers: (String userUid) => _navigateToFollowers(userUid),
          onShowFollowing: (String userUid) => _navigateToFollowing(userUid),
          onShowFavorites: (String userUid) => _navigateToFavorites(userUid),
          onGoToComments: (String reelUuid) => _navigateToComments(reelUuid),
          onShowUserProfile: (String userUid) => _navigateToProfile(userUid),
        )
      ]),
      binding: MainBinding(),
      bindings: [
        HomeBinding(),
        ProfileBinding(),
        DiscoverContentBinding(),
        FavoritesBinding()
      ],
      children: [
        GetPage(
          name: _Paths.PROFILE,
          page: () => ProfileScreen(
            onShowFollowers: (String userUid) => _navigateToFollowers(userUid),
            onShowFollowing: (String userUid) => _navigateToFollowing(userUid),
            onShowFavorites: (String userUid) => _navigateToFavorites(userUid),
            onGoToComments: (String reelUuid) => _navigateToComments(reelUuid),
            onShowUserProfile: (String userUid) => _navigateToProfile(userUid),
          ),
          transition: Transition.downToUp,
          binding: ProfileBinding(),
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.DISCOVER,
          page: () => DiscoverContentScreen(
            onShowUserProfile: (userUuid) => _navigateToProfile(userUuid),
            onGoToComments: (String reelUuid) => _navigateToComments(reelUuid),
          ),
          transition: Transition.downToUp,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.COMMENTS,
          binding: CommentsBinding(),
          page: () => CommentsScreen(
              onBackPressed: () {
                Get.back();
              },
              onShowUserProfile: (userUuid) => _navigateToProfile(userUuid)),
          transition: Transition.leftToRight,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.FOLLOWERS,
          binding: FollowersBinding(),
          page: () => FollowersScreen(
              onShowUserProfile: (userUuid) => _navigateToProfile(userUuid)),
          transition: Transition.leftToRight,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.FAVORITES,
          binding: FavoritesBinding(),
          page: () => FavoritesScreen(
            onGoToComments: (String reelUuid) => _navigateToComments(reelUuid),
            onShowUserProfile: (String userUid) => _navigateToProfile(userUid),
          ),
          transition: Transition.leftToRight,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        )
      ],
      middlewares: [AuthMiddleware(), SystemUiMiddleware()],
    ),
  ];
}
