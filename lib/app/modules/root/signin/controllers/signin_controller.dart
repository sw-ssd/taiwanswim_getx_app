// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/models/member_model.dart';
import 'package:taiwanswim_getx_app/app/data/providers/member_provider.dart';
import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class SigninController extends GetxController {
  final provider = Get.find<SigninProvider>();
  final mbrStore = Get.find<MemeberProvider>();
  final pd = Get.find<PrefData>();

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

  void googleLogin() async {
    try {
      final uc = await provider.signinWithGoogle();
      final user = uc.user;
      debugPrint('user: $user');

      if (user != null) {
        final m = MemberModel(
          email: user.email,
          displayName: user.displayName,
          photoURL: user.photoURL,
        );
        final pdd = m.toJson();

        await mbrStore.setMember(m, user.uid);
        await pd.setAuthMember(user.uid, pdd);
        await pd.setLogin(true);
      }
      final uid = user!.uid;
      Get.snackbar('歡迎回來', '${user!.displayName}');
      Get.rootDelegate.offAndToNamed(Routes.HOME, arguments: {'uid': uid});
    } catch (e) {
      Get.snackbar('錯誤', '登入失敗');
    }
  }

  void googleLogout() async {
    try {
      await provider.signoutWithGoogle();
      Get.snackbar('成功', '登出成功');
    } catch (e) {
      Get.snackbar('錯誤', '登出失敗');
    }
  }

  void appleToggle() {
    debugPrint('apple click');
  }
}
