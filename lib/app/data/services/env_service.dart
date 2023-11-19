// ignore_for_file: unnecessary_overrides

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class EnvService extends GetxService {
  @override
  onInit() async {
    super.onInit();
    await dotenv.load(fileName: ".env");
  }

  String getEnv(String envTag) => dotenv.env[envTag] ?? '';
}
