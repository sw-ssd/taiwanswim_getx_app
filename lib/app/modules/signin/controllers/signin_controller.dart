// ignore_for_file: unnecessary_overrides

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/providers/firebase_store_provider.dart';
import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class SigninController extends GetxController {
  final provider = Get.find<SigninProvider>();
  final store = Get.find<FirebaseStoreProvider>();

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

      final doc = await store.members.doc(user!.uid).get();
      if (doc.exists) {
        debugPrint('user: ${doc.data()}');
        return;
      } else {
        store.members.doc(user!.uid).set({
          'uid': user.uid,
          'email': user.email,
          'displayName': user.displayName,
          'photoURL': user.photoURL,
          'lastSignInTime': user.metadata.lastSignInTime,
          'creationTime': user.metadata.creationTime,
        });
      }

      Get.snackbar('成功', '登入成功');
      Get.offAllNamed(Routes.HOME);
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
