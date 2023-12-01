// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/constants/app_constants.dart';
import 'package:taiwanswim_getx_app/app/data/models/member_model.dart';
import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  final si = Get.find<SigninProvider>();
  final pd = Get.find<PrefData>();
  final displayName = AppConstants.guestDisplayName.obs;
  final email = AppConstants.guestEmail.obs;
  final photoURL = AssetConstants.defaultAvatar.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    final uid = await pd.getAuthKey();
    await getMember(uid);
  }

  getMember(String? uid) async {
    final m = await pd.getAuthMember(uid ?? "");
    final mm = MemberModel.fromJson(m);
    displayName.value = mm.displayName ?? AppConstants.guestDisplayName;
    email.value = mm.email ?? AppConstants.guestEmail;
    photoURL.value = mm.photoURL ?? AssetConstants.defaultAvatar;
    update();
  }

  googleLogout() async {
    try {
      await si.signoutWithGoogle();
      await pd.setAuthKey("");
      await pd.setAuthMember("", '{}');
      await pd.setLogin(false);
      Get.rootDelegate.offAndToNamed(Routes.SIGNIN);
      Get.snackbar('成功', '登出成功');
    } catch (e) {
      Get.snackbar('錯誤', '登出失敗');
    }
  }
}
