import 'package:flutter_dotenv/flutter_dotenv.dart';

String getEnvBaseUrl() {
  final String host = dotenv.env['HOST'] ?? 'localhost';
  final String port = dotenv.env['PORT'] ?? '8090';
  final String schema = dotenv.env['SCHEMA'] ?? 'http';
  return '$schema://$host:$port';
}
