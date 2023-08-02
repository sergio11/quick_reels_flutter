import 'package:get/get.dart';
import 'package:quickreels/app/features/home/views/home_screen.dart';
import 'package:quickreels/app/features/login/bindings/login_binding.dart';
import 'package:quickreels/app/features/login/views/login_screen.dart';
import 'package:quickreels/app/features/signup/bindings/signup_binding.dart';
import 'package:quickreels/app/features/signup/views/signup_screen.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen()
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    )
  ];
}
