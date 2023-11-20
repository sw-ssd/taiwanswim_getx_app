// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';

import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/utils/tools.dart';

class PbService extends GetxService {
  PocketBase init({String? baseUrl, required AsyncAuthStore store}) {
    baseUrl = getEnvBaseUrl();
    final pb = PocketBase(
      baseUrl,
      authStore: store,
    );
    return pb;
  }

  @override
  void onInit() async {
    super.onInit();

    final store = await Get.find<PrefData>().initAuthStore();
    GetIt.I.registerSingleton<PocketBase>(init(store: store));
  }
}
