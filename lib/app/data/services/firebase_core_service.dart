import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/firebase_options.dart';

class FirebaseService extends GetxService {
  @override
  onInit() async {
    super.onInit();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
