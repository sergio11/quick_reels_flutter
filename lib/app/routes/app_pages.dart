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
          onSignInPressed: () => Get.offAllNamed(Routes.SIGN_IN),
          onSignUpPressed: () => Get.offAllNamed(Routes.SIGN_UP)
      )
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInScreen(
          onSignInSuccess: () => Get.offAllNamed(Routes.SIGN_UP),
          onGoToSignUp: () => Get.offAllNamed(Routes.SIGN_UP)
      ),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignupScreen(onGoToSignIn: () => Get.offAllNamed(Routes.SIGN_IN),),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
    )
  ];
}
