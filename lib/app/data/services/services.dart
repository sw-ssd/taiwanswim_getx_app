import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/env_service.dart';
import 'package:taiwanswim_getx_app/app/data/services/firebase_core_service.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';

void initServices() async {
  Get.putAsync<EnvService>(() async => EnvService());
  Get.putAsync<FirebaseService>(() async => FirebaseService());

  // have providers Api
  Get.putAsync<PrefData>(() async => PrefData());
}
