import 'package:flutter/material.dart';

class TypeAlertSnackBarEntity {
  const TypeAlertSnackBarEntity({
    required this.icon,
    required this.label,
    required this.color,
  });

  final Color color;
  final String label;
  final IconData icon;

  TypeAlertSnackBarEntity copyWith({
    Color? color,
    String? label,
    IconData? icon,
  }) {
    return TypeAlertSnackBarEntity(
      icon: icon ?? this.icon,
      color: color ?? this.color,
      label: label ?? this.label,
    );
  }
}
