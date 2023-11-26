// ignore_for_file: unnecessary_overrides

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class SigninController extends GetxController {
  final provider = Get.find<SigninProvider>();
  @override
  void onInit() {
    super.onInit();
    // provider.listenGoogle();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleLogin() async {
    try {
      final user = await provider.signInByGoogle();
      debugPrint('user: $user');
      Get.offAllNamed(Routes.HOME);

      Get.snackbar('成功', '登入成功');
    } catch (e) {
      Get.snackbar('錯誤', '登入失敗');
    }
  }

  void googleLogout() async {
    try {
      await provider.signOutByGoogle();
      Get.snackbar('成功', '登出成功');
    } catch (e) {
      Get.snackbar('錯誤', '登出失敗');
    }
  }

  void appleToggle() {
    debugPrint('apple click');
  }
}
