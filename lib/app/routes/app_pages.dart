import 'package:get/get.dart';
import 'package:quickreels/app/features/signin/bindings/signin_binding.dart';
import 'package:quickreels/app/features/signin/views/signin_screen.dart';
import 'package:quickreels/app/features/signup/bindings/signup_binding.dart';
import 'package:quickreels/app/features/signup/views/signup_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
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
      page: () => SignupScreen(),
      binding: SignupBinding(),
    )
  ];
}
