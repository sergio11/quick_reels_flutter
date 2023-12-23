part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const ONBOARDING = _Paths.ONBOARDING;
  static const SIGN_IN = _Paths.SIGN_IN;
  static const HOME = _Paths.HOME;
  static const SIGN_UP = _Paths.SIGN_UP;
  static const PROFILE = _Paths.PROFILE;
  static const DISCOVER = _Paths.DISCOVER;
  static const COMMENTS = _Paths.COMMENTS;
}

abstract class _Paths {
  static const ONBOARDING = '/onboarding';
  static const SIGN_IN = '/sign-in';
  static const HOME = '/home';
  static const SIGN_UP = '/sign-up';
  static const PROFILE = '/profile';
  static const DISCOVER = '/discover';
  static const COMMENTS = '/comments';
  static const FOLLOWERS = '/followers';
}
