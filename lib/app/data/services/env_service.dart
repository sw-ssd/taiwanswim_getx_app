// ignore_for_file: unnecessary_overrides

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class EnvService extends GetxService {
  @override
  onInit() async {
    super.onInit();
    await init();
  }

  init() async {
    await dotenv.load(fileName: ".env");
  }

  String getEnv(String envTag) => getEnvWithDefault(envTag, "");

  String getEnvWithDefault(String envTag, String def) =>
      dotenv.env[envTag] ?? def;
}
