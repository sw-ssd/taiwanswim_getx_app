// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';

import 'package:taiwanswim_getx_app/app/data/constants/api_paths.dart';

class PbService extends GetxService {
  PocketBase init() {
    final pb = PocketBase('${ApiPaths.BASE_URL}:${ApiPaths.BASE_PORT}');
    return pb;
  }

  @override
  void onInit() {
    super.onInit();
    GetIt.I.registerSingleton<PocketBase>(init());
  }
}
