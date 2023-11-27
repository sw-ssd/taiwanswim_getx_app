import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class AuthGuardMiddleware extends GetMiddleware {
  int? _priority;

  @override
  int? get priority => _priority;

  @override
  set priority(int? value) {
    _priority = value;
  }

  AuthGuardMiddleware({int? priority}) : _priority = priority;

  // @override
  // RouteSettings? redirect(String? route) {
  //   final pd = Get.find<PrefData>();
  //   pd.getLogin().then((value) {
  //     if (!value && route == Routes.HOME) {
  //       debugPrint('AuthGuardMiddleware: redirect to ${Routes.SIGNIN}');
  //       return const RouteSettings(name: Routes.SIGNIN);
  //     }
  //   });
  //   return null;
  // }

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final pd = Get.find<PrefData>();
    final isLogin = await pd.getLogin();
    print(': isLogin: $isLogin');
    if (isLogin) {
      return null;
    }
    return await super.redirectDelegate(route);
  }
}
