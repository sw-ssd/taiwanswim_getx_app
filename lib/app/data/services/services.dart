import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/env_service.dart';
import 'package:taiwanswim_getx_app/app/data/services/pockbase_service.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';

/// 在你執行Flutter應用程式之前，讓你的服務初始化是明智之舉。
/// 因為你可以控制執行流程（也許你需要載入一些主題配置，apiKey，由使用者自訂的語言等，所以在執行ApiService之前載入SettingService。
/// 所以GetMaterialApp()不需要重建，可以直接取值。
void initServices() async {
  Get.putAsync<EnvService>(() async => EnvService());
  Get.putAsync<PrefData>(() async => PrefData());
  Get.putAsync<PbService>(() async => PbService(), tag: 'pb', permanent: true);
}
