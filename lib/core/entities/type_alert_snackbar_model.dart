import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TypeAlertSnackBarEntity extends Equatable {
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

  @override
  List<Object?> get props => [icon, label, color];
}
