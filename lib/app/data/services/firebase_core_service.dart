import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in_dartio/google_sign_in_dartio.dart';

import 'package:taiwanswim_getx_app/firebase_options.dart';

bool shouldUseFirebaseEmulator = false;

class FirebaseService extends GetxService {
  late final FirebaseApp _app;
  late final FirebaseAuth _auth;
  @override
  onInit() async {
    super.onInit();

    _app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _auth = FirebaseAuth.instanceFor(app: _app);

    if (kDebugMode && shouldUseFirebaseEmulator) {
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    }

    if (!kIsWeb && GetPlatform.isWindows) {
      await GoogleSignInDart.register(
        clientId:
            '91042964671-fttriak1rdgs6ocb8ckr711358ou9dsj.apps.googleusercontent.com',
      );
    }
  }

  FirebaseApp get app => _app;
  FirebaseAuth get auth => _auth;
}
