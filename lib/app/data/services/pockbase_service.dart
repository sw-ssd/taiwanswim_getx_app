// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';

import 'package:taiwanswim_getx_app/app/data/constants/api_paths.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';

class PbService extends GetxService {
  PocketBase init(
      {String url = ApiPaths.BASE_URL,
      String port = ApiPaths.BASE_PORT,
      required AsyncAuthStore store}) {
    final pb = PocketBase(
      '${ApiPaths.BASE_URL}:${ApiPaths.BASE_PORT}',
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
