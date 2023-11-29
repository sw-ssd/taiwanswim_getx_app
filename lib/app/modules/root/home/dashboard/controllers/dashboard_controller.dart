import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  final si = Get.find<SigninProvider>();
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

  googleLogout() async {
    try {
      await si.signoutWithGoogle();
      await pd.setLogin(false);
      Get.rootDelegate.offAndToNamed(Routes.SIGNIN);
      Get.snackbar('成功', '登出成功');
    } catch (e) {
      Get.snackbar('錯誤', '登出失敗');
    }
  }
}
