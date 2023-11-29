// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const ROOT = _Paths.ROOT;
  static const SPLASH = _Paths.SPLASH;
  static const ONBOARD = _Paths.ONBOARD;
  static const SIGNIN = _Paths.SIGNIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const HOME = _Paths.HOME;
  static const DASHBOARD = _Paths.HOME + _Paths.DASHBOARD;
  static const PROFILE = _Paths.ROOT + _Paths.HOME + _Paths.PROFILE;
  static const RECORDS = _Paths.ROOT + _Paths.HOME + _Paths.RECORDS;

  Routes._();
  static String SIGNIN_THEN(String afterSuccessfulLogin) =>
      '$SIGNIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  // static String PRODUCT_DETAILS(String productId) => '$PRODUCTS/$productId';
}

abstract class _Paths {
  _Paths._();
  static const ROOT = '/root';
  static const SPLASH = '/splash';
  static const ONBOARD = '/onboard';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const HOME = '/home';
  static const DASHBOARD = '/dashboard';
  static const PROFILE = '/profile';
  static const RECORDS = '/records';
}
