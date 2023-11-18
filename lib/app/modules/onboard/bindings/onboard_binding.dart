import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/providers/onboard_provider.dart';

import '../controllers/onboard_controller.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardController>(() => OnboardController());
    Get.lazyPut<OnboardProvider>(() => OnboardProvider());
  }
}
