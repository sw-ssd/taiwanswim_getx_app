import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';
import 'package:taiwanswim_getx_app/utils/tools.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print('redirect: $route');

    return null;
  }

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final pd = Get.find<PrefData>();
    final isLogin = await pd.getLogin();
    // you can do whatever you want here
    // but it's preferable to make this method fast
    await Future.delayed(const Duration(milliseconds: 500));

    if (!isLogin) {
      print('EnsureAuthMiddleware: ${route.uri.toString()}');
      return GetNavConfig.fromRoute(route.uri.toString());
    }
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final pd = Get.find<PrefData>();
    final isLogin = await pd.getLogin();

    await Future.delayed(const Duration(milliseconds: 500));
    if (isLogin) {
      //NEVER navigate to auth screen, when user is already authed
      print(
          'EnsureNotAuthedMiddleware: ${Get.routeTree.matchRoute(Routes.HOME).arguments}');
      // return GetNavConfig.fromRoute(Routes.HOME);
      return null;
      //OR redirect user to another screen
      //return GetNavConfig.fromRoute(Routes.PROFILE);
    }
    return await super.redirectDelegate(route);
  }
}
