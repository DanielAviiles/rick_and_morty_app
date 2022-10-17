import 'package:flutter/material.dart';

class TypeAlertSnackBar {
  const TypeAlertSnackBar({
    required this.icon,
    required this.label,
    required this.color,
  });

  final Color color;
  final String label;
  final IconData icon;

  TypeAlertSnackBar copyWith({
    Color? color,
    String? label,
    IconData? icon,
  }) {
    return TypeAlertSnackBar(
      icon: icon ?? this.icon,
      color: color ?? this.color,
      label: label ?? this.label,
    );
  }
}
