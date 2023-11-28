import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/env_service.dart';

String getEnvBaseUrl() {
  final dot = Get.find<EnvService>();

  final String host = dot.getEnvWithDefault("HOST", "localhost");
  final String port = dot.getEnvWithDefault("PORT", "8080");
  final String schema = dot.getEnvWithDefault("SCHEMA", "http");
  return '$schema://$host:$port';
}
