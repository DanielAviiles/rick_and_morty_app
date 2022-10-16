import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRouteConfig {
  static String get baseUrl => dotenv.get('BASE_URL', fallback: null);
  static Future<void> loadEnviroments() async {
    try {
      if (kReleaseMode) {
        await dotenv.load(fileName: '.env.production');
      } else {
        await dotenv.load(fileName: '.env.development');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
