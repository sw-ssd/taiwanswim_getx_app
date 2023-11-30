import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/models/member_model.dart';
import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';
import 'package:taiwanswim_getx_app/utils/tools.dart';

class DashboardController extends GetxController {
  final si = Get.find<SigninProvider>();
  final pd = Get.find<PrefData>();

  final member = MemberModel(
          displayName: "User",
          email: "guest@test.com",
          photoURL: "assets/images/successpayment.png")
      .obs;

  @override
  void onReady() async {
    super.onInit();
    final uid = await pd.getAuthKey();
    await getMember(uid);
  }

  getMember(String? uid) async {
    if (uid == null) {
      return;
    }
    final m = await pd.getAuthMember(uid);
    member.update((val) {
      val?.displayName = m.displayName;
      val?.email = m.email;
      val?.photoURL = m.photoURL;
    });
    update();
    // print('member: ${member.value.displayName}');
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
