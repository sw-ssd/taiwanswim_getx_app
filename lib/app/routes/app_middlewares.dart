import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class EnsureNotAuthedMiddleware extends GetMiddleware {
  int? _priority;

  @override
  int? get priority => _priority;

  @override
  set priority(int? value) {
    _priority = value;
  }

  EnsureNotAuthedMiddleware({int? priority}) : _priority = priority;

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final pd = Get.find<PrefData>();
    final isLogin = await pd.getLogin();
    if (isLogin && route.uri.toString() == Routes.HOME) {
      return null;
    }
    return await super.redirectDelegate(route);
  }
}


// class EnsureAuthMiddleware extends GetMiddleware {
//   @override
//   Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
//     // you can do whatever you want here
//     // but it's preferable to make this method fast
//     // await Future.delayed(Duration(milliseconds: 500));

//     if (!AuthService.to.isLoggedInValue) {
//       final newRoute = Routes.LOGIN_THEN(route.location!);
//       return GetNavConfig.fromRoute(newRoute);
//     }
//     return await super.redirectDelegate(route);
//   }
// }

// class EnsureNotAuthedMiddleware extends GetMiddleware {
//   @override
//   Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
//     if (AuthService.to.isLoggedInValue) {
//       //NEVER navigate to auth screen, when user is already authed
//       return null;

//       //OR redirect user to another screen
//       //return GetNavConfig.fromRoute(Routes.PROFILE);
//     }
//     return await super.redirectDelegate(route);
//   }
// }
