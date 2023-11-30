import 'package:get/get.dart';

import '../modules/root/bindings/root_binding.dart';
import '../modules/root/home/bindings/home_binding.dart';
import '../modules/root/home/dashboard/bindings/dashboard_binding.dart';
import '../modules/root/home/dashboard/views/dashboard_view.dart';
import '../modules/root/home/profile/bindings/profile_binding.dart';
import '../modules/root/home/profile/views/profile_view.dart';
import '../modules/root/home/records/bindings/records_binding.dart';
import '../modules/root/home/records/views/records_view.dart';
import '../modules/root/home/views/home_view.dart';
import '../modules/root/onboard/bindings/onboard_binding.dart';
import '../modules/root/onboard/views/onboard_view.dart';
import '../modules/root/signin/bindings/signin_binding.dart';
import '../modules/root/signin/views/signin_view.dart';
import '../modules/root/views/root_view.dart';

import 'app_middlewares.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      middlewares: [
        //only enter this route when not authed
        EnsureAuthMiddleware()
      ],
      children: [
        GetPage(
          middlewares: [
            //only enter this route when not authed
            EnsureNotAuthedMiddleware()
          ],
          name: _Paths.SIGNIN,
          page: () => const SigninView(),
          binding: SigninBinding(),
        ),
        GetPage(
          preventDuplicates: true,
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
          middlewares: [
            //only enter this route when authed
            EnsureAuthMiddleware()
          ],
          title: null,
          children: [
            GetPage(
              name: _Paths.DASHBOARD,
              page: () => const DashboardView(),
              binding: DashboardBinding(),
              // middlewares: [
              //   //only enter this route when authed
              //   EnsureAuthMiddleware()
              // ],
            ),
            GetPage(
              name: _Paths.PROFILE,
              page: () => const ProfileView(),
              binding: ProfileBinding(),
              // middlewares: [
              //   //only enter this route when authed
              //   EnsureAuthMiddleware()
              // ],
            ),
            GetPage(
              name: _Paths.RECORDS,
              page: () => const RecordsView(),
              binding: RecordsBinding(),
              // middlewares: [
              //   //only enter this route when authed
              //   EnsureAuthMiddleware()
              // ],
            ),
          ],
        ),
        GetPage(
          // preventDuplicates: true,
          name: _Paths.ONBOARD,
          page: () => const OnboardView(),
          binding: OnboardBinding(),
        ),
      ],
    ),
  ];
}
