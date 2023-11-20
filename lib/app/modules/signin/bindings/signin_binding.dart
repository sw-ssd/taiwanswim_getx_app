import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/providers/signin_provider.dart';

import '../controllers/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninProvider>(() => SigninProvider());
    Get.lazyPut<SigninController>(
      () => SigninController(),
    );
  }
}
