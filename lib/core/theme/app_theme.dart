import 'package:flutter/material.dart';

class AppTheme {
  static Color mainColor = const Color.fromRGBO(0, 116, 189, .9);
  static MaterialColor primaryColor = MaterialColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Colors.deepPurple.shade50,
      100: Colors.deepPurple.shade100,
      200: Colors.deepPurple.shade200,
      300: Colors.deepPurple.shade300,
      400: Colors.deepPurple.shade400,
      500: Colors.deepPurple.shade500,
      600: Colors.deepPurple.shade600,
      700: Colors.deepPurple.shade700,
      800: Colors.deepPurple.shade800,
      900: Colors.deepPurple.shade900,
    },
  );
  static const int _orangePrimaryValue = 0xFE580FF;
}
