import 'dart:async';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  getIntro() async {
    final pd = Get.find<PrefData>();
    bool isIntro = await pd.getIntro();

    // for testing
    // isIntro = false;

    if (isIntro == false) {
      Timer(const Duration(seconds: 3),
          () => Get.rootDelegate.offAndToNamed(Routes.ONBOARD));

      // } else {
      //   Get.rootDelegate.toNamed(Routes.SIGNIN);
    }
  }
}
