part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SIGN_IN = _Paths.SIGN_IN;
  static const HOME = _Paths.HOME;
  static const SIGN_UP = _Paths.SIGN_UP;
}

abstract class _Paths {
  static const SIGN_IN = '/sign-in';
  static const HOME = '/home';
  static const SIGN_UP = '/sign-up';
}
