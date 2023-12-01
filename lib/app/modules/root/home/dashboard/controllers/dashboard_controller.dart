import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/constants/app_constants.dart';
import 'package:taiwanswim_getx_app/app/data/models/dashboard_model.dart';
import 'package:taiwanswim_getx_app/app/data/models/member_model.dart';
import 'package:taiwanswim_getx_app/app/data/providers/dashboard_provider.dart';
import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  final _si = Get.find<SigninProvider>();
  final _pd = Get.find<PrefData>();
  final _op = Get.find<DashboardProvider>();

  final uid = "".obs;
  final displayName = AppConstants.guestDisplayName.obs;
  final email = AppConstants.guestEmail.obs;
  final photoURL = AssetConstants.defaultAvatar.obs;

  final currentpage = 1.obs;
  final buttonpos = false.obs;
  final RxList<DashSlider> sliders = <DashSlider>[].obs;
  final RxList<Design> designs = <Design>[].obs;

  bool buttonvalue = false;
  int currentvalue = 0;

  @override
  void onInit() {
    init();
    sliders.addAll(_op.sliders);
    designs.addAll(_op.designs);
    super.onInit();
  }

  void init() async {
    uid.value = await _pd.getAuthKey();
    await getMember(uid);
  }

  onChange(RxInt index) {
    currentpage.value = index.value;
    update();
  }

  onPosChange(RxBool currentbuttonpos) {
    buttonpos.value = currentbuttonpos.value;
    update();
  }

  getMember(RxString uid) async {
    final m = await _pd.getAuthMember(uid.value);
    final mm = MemberModel.fromJson(m);
    displayName.value = mm.displayName ?? AppConstants.guestDisplayName;
    email.value = mm.email ?? AppConstants.guestEmail;
    photoURL.value = mm.photoURL ?? AssetConstants.defaultAvatar;
    update();
  }

  googleLogout() async {
    try {
      await _si.signoutWithGoogle();
      await _pd.setAuthKey("");
      await _pd.setAuthMember("", '{}');
      await _pd.setLogin(false);
      Get.rootDelegate.offAndToNamed(Routes.SIGNIN);
      Get.snackbar('成功', '登出成功');
    } catch (e) {
      Get.snackbar('錯誤', '登出失敗');
    }
  }
}
