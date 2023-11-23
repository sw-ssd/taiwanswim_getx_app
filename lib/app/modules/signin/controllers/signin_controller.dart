// ignore_for_file: unnecessary_overrides

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';

class SigninController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleToggle() async {
    final p = Get.find<SigninProvider>();
    try {
      await p.googleOAuth2();
    } catch (e) {
      Get.snackbar('錯誤', '登入失敗');
    }
  }

  void appleToggle() {
    debugPrint('apple click');
  }
}
