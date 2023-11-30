import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final pd = Get.find<PrefData>();
    final isLogin = await pd.getLogin();
    // you can do whatever you want here
    // but it's preferable to make this method fast
    await Future.delayed(const Duration(milliseconds: 500));

    // print('route: ${route.uri}');

    if (!isLogin) {
      print('EnsureAuthMiddleware: redirect to signin');
      final newRoute = Routes.signinThen(route.location);
      return GetNavConfig.fromRoute(newRoute);
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
      print('EnsureNotAuthedMiddleware: redirect to home');
      return null;
      // return null;
      //OR redirect user to another screen
      //return GetNavConfig.fromRoute(Routes.PROFILE);
    }
    return await super.redirectDelegate(route);
  }
}
