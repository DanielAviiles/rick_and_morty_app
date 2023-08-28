import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavigationItemEntity extends Equatable {
  const NavigationItemEntity({
    required this.icon,
    required this.name,
    required this.widget,
  });

  final String name;
  final Widget widget;
  final IconData icon;

  NavigationItemEntity copyWith({
    Widget? widget,
    String? label,
    IconData? icon,
    bool? badge,
    bool? validateAcess,
  }) {
    return NavigationItemEntity(
      name: label ?? name,
      icon: icon ?? this.icon,
      widget: widget ?? this.widget,
    );
  }

  @override
  List<Object?> get props => [icon, name, widget];
}
