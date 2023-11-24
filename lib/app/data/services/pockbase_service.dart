// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/utils/tools.dart';

class PbService extends GetxService {
  Future<PocketBase> init({String? baseUrl}) async {
    baseUrl = getEnvBaseUrl();
    final store = await Get.find<PrefData>().initAuthStore();
    final pb = PocketBase(
      baseUrl,
      authStore: store,
    );
    return pb;
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
