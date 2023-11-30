import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in_dartio/google_sign_in_dartio.dart';

import 'package:taiwanswim_getx_app/firebase_options.dart';

bool shouldUseEmulator = false;

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

    if (kDebugMode && shouldUseEmulator) {
      await _connectToFirebaseEmulator();
    }

    if (!kIsWeb && GetPlatform.isWindows) {
      await GoogleSignInDart.register(
        clientId:
            '91042964671-fttriak1rdgs6ocb8ckr711358ou9dsj.apps.googleusercontent.com',
      );
    }
  }

  Future _connectToFirebaseEmulator() async {
    final localHostString = GetPlatform.isAndroid ? "10.0.2.2" : "localhost";

    print('Connecting to Firebase Emulator at $localHostString');

    FirebaseFirestore.instance.settings = const Settings(
      sslEnabled: false,
      persistenceEnabled: false,
    );

    FirebaseFirestore.instance
        .useFirestoreEmulator('http://$localHostString', 8080);
    // await FirebaseAuth.instance
    //     .useAuthEmulator('http://$localHostString', 9099);
  }

  FirebaseApp get app => _app;
  FirebaseAuth get auth => _auth;
}
