import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/providers/dashboard_provider.dart';
import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<SigninProvider>(() => SigninProvider());
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
  }
}
