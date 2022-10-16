import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRouteConfig {
  static String get baseUrl => dotenv.get('BASE_URL', fallback: null);
  static String get publicApiKey =>
      dotenv.get('PUBLIC_API_KEY', fallback: null);
  static String get privateApiKey =>
      dotenv.get('PRIVATE_API_KEY', fallback: null);
  static Future<void> loadEnviroments() async {
    if (kReleaseMode) {
      await dotenv.load(fileName: '.env.production');
    } else {
      await dotenv.load(fileName: '.env.development');
    }
  }
}
