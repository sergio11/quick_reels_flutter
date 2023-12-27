import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/features/comments/bindings/comments_binding.dart';
import 'package:quickreels/app/features/comments/views/comments_screen.dart';
import 'package:quickreels/app/features/discover/bindings/discover_content_binding.dart';
import 'package:quickreels/app/features/discover/views/discover_content_screen.dart';
import 'package:quickreels/app/features/editprofile/bindings/edit_profile_binding.dart';
import 'package:quickreels/app/features/editprofile/views/edit_profile_screen.dart';
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
import 'package:quickreels/app/features/upload/bindings/upload_reel_binding.dart';
import 'package:quickreels/app/features/upload/views/upload_reel_screen.dart';
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

  static void navigateToInitial() {
    _navigateTo(INITIAL);
  }

  static void navigateToMain() {
    _navigateTo(Routes.HOME);
  }

  static void goBack() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.back();
    });
  }

  static void _navigateToProfile(String userUid) {
    _navigateTo(_Paths.HOME + _Paths.PROFILE,
        arguments: {USER_UUID_KEY: userUid});
  }

  static void _navigateToEditProfile(String userUid) {
    _navigateTo(_Paths.HOME + _Paths.EDIT_PROFILE,
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

  static OnBoardingScreen _buildOnBoardingScreen() => OnBoardingScreen(
        onSignInPressed: () => _navigateTo(Routes.SIGN_IN),
        onSignUpPressed: () => _navigateTo(Routes.SIGN_UP),
      );

  static SignInScreen _buildSignInScreen() => SignInScreen(
        onSignInSuccess: () => navigateToMain(),
        onGoToSignUp: () => _navigateTo(Routes.SIGN_UP),
      );

  static SignupScreen _buildSignupScreen() => SignupScreen(
        onGoToSignIn: () => _navigateTo(Routes.SIGN_IN),
        onSignUpSuccess: () => _navigateTo(Routes.HOME),
      );

  static HomeScreen _buildHomeScreen() => HomeScreen(
        onGoToComments: (reelUuid) => _navigateToComments(reelUuid),
        onGoToUserProfile: (userUuid) => _navigateToProfile(userUuid),
      );

  static DiscoverContentScreen _buildDiscoverContentScreen() =>
      DiscoverContentScreen(
        onShowUserProfile: (userUuid) => _navigateToProfile(userUuid),
        onGoToComments: (String reelUuid) => _navigateToComments(reelUuid),
      );

  static FavoritesScreen _buildFavoritesScreen() => FavoritesScreen(
        onGoToComments: (String reelUuid) => _navigateToComments(reelUuid),
        onShowUserProfile: (String userUid) => _navigateToProfile(userUid),
      );

  static ProfileScreen _buildProfileScreen() => ProfileScreen(
        onShowFollowers: (String userUid) => _navigateToFollowers(userUid),
        onShowFollowing: (String userUid) => _navigateToFollowing(userUid),
        onShowFavorites: (String userUid) => _navigateToFavorites(userUid),
        onGoToComments: (String reelUuid) => _navigateToComments(reelUuid),
        onShowUserProfile: (String userUid) => _navigateToProfile(userUid),
        onEditProfile: (String userUid) => _navigateToEditProfile(userUid),
      );

  static UploadReelScreen _buildUploadReelScreen() =>
      UploadReelScreen(onBackPressed: goBack, onReelUploaded: navigateToMain,);

  static CommentsScreen _buildCommentScreen() => CommentsScreen(
      onBackPressed: goBack,
      onShowUserProfile: (userUuid) => _navigateToProfile(userUuid));

  static EditProfileScreen _buildEditProfileScreen() => EditProfileScreen();

  static FollowersScreen _buildFollowersScreen() => FollowersScreen(
      onShowUserProfile: (userUuid) => _navigateToProfile(userUuid));

  static MainScreen _buildMainScreen() => MainScreen(tabItems: [
        _buildHomeScreen(),
        _buildDiscoverContentScreen(),
        _buildUploadReelScreen(),
        _buildFavoritesScreen(),
        _buildProfileScreen()
      ]);

  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: _buildOnBoardingScreen,
      middlewares: [AuthMiddleware(), SystemUiMiddleware()],
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: _buildSignInScreen,
      binding: SignInBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 500),
      middlewares: [AuthMiddleware(), SystemUiMiddleware()],
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: _buildSignupScreen,
      binding: SignupBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 500),
      middlewares: [AuthMiddleware(), SystemUiMiddleware()],
    ),
    GetPage(
      name: _Paths.HOME,
      page: _buildMainScreen,
      binding: MainBinding(),
      bindings: [
        HomeBinding(),
        ProfileBinding(),
        UploadReelBinding(),
        DiscoverContentBinding(),
        FavoritesBinding()
      ],
      children: [
        GetPage(
          name: _Paths.PROFILE,
          page: _buildProfileScreen,
          transition: Transition.downToUp,
          binding: ProfileBinding(),
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.DISCOVER,
          page: _buildDiscoverContentScreen,
          transition: Transition.downToUp,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.COMMENTS,
          binding: CommentsBinding(),
          page: _buildCommentScreen,
          transition: Transition.leftToRight,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.FOLLOWERS,
          binding: FollowersBinding(),
          page: _buildFollowersScreen,
          transition: Transition.leftToRight,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.FAVORITES,
          binding: FavoritesBinding(),
          page: _buildFavoritesScreen,
          transition: Transition.leftToRight,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.EDIT_PROFILE,
          binding: EditProfileBinding(),
          page: _buildEditProfileScreen,
          transition: Transition.leftToRight,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: _Paths.UPLOAD_REEL,
          binding: UploadReelBinding(),
          page: _buildUploadReelScreen,
          transition: Transition.leftToRight,
          curve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 400),
        )
      ],
      middlewares: [AuthMiddleware(), SystemUiMiddleware()],
    ),
  ];
}
