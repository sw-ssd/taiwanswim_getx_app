// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';

import 'package:firebase_auth/firebase_auth.dart';
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
  void onClose() {
    super.onClose();
  }

  void googleLogin() async {
    try {
      final uc = await provider.signinWithGoogle();
      final user = uc.user;

      if (user != null) {
        final m = MemberModel(
          email: user.email,
          displayName: user.displayName,
          photoURL: user.photoURL,
        );

        await _saveAuth(m, user);
      }
      final thenTo = Get
          .rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];

      Get.rootDelegate.offNamed(thenTo ?? Routes.HOME);
      Get.snackbar('歡迎回來', '${user!.displayName}');
    } catch (e) {
      await pd.setLogin(false);
      Get.snackbar('錯誤', '登入失敗');
    }
  }

  void appleToggle() {
    debugPrint('apple click');
  }

  void googleLogout() async {
    try {
      await _saveAuthEmpty();
      Get.snackbar('成功', '登出成功');
    } catch (e) {
      Get.snackbar('錯誤', '登出失敗');
    }
  }

  Future<void> _saveAuthEmpty() async {
    await provider.signoutWithGoogle();
    await pd.setAuthKey("");
    await pd.setAuthMember("", '{}');
    await pd.setLogin(false);
  }

  Future<void> _saveAuth(MemberModel m, User user) async {
    await mbrStore.setMember(m, user.uid);
    await pd.setAuthKey(user.uid);
    await pd.setAuthMember(user.uid, m.toJson());
    await pd.setLogin(true);
  }
}
