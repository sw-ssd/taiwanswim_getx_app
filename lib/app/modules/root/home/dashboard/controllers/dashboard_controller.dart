// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/models/member_model.dart';
import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  final si = Get.find<SigninProvider>();
  final pd = Get.find<PrefData>();
  final displayName = 'User'.obs;
  final email = 'guest@ex.com'.obs;
  final photoURL =
      'https://lh3.googleusercontent.com/a/ACg8ocIBCOSoggEX4RrU7vmzX_qnG-TBboty3cmrbV593-9vog=s96-c'
          .obs;

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
    displayName.value = mm.displayName!;
    email.value = mm.email ?? 'guest@ex.com';
    photoURL.value = mm.photoURL ?? '';
    update();
    log('photoURL: ${photoURL.value}');
//     File picture = await ImagePicker.pickImage(source: ImageSource.camera);
// Image.file(picture, width: 500, height: 500)
// You can use this same file to display the image.
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
