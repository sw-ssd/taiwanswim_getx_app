import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/shared_pref.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  int? _priority;

  @override
  int? get priority => _priority;

  @override
  set priority(int? value) {
    _priority = value;
  }

  AuthMiddleware({int? priority}) : _priority = priority;

  @override
  RouteSettings? redirect(String? route) {
    final pd = Get.find<PrefData>();

    pd.getLogin().then((value) {
      if (value == false) {
        Future.delayed(
            const Duration(seconds: 1), () => Get.snackbar("提示", "請先登入APP"));
        return const RouteSettings(name: Routes.SIGNIN);
      }
    });
    return null;
  }
}
