import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/entities/type_alert_snackbar_model.dart';

enum TypeAlert {
  success,
  error,
}

const Map<String, TypeAlertSnackBarEntity> typeAlert = {
  'success': TypeAlertSnackBarEntity(
    label: 'Success',
    color: Colors.green,
    icon: Icons.check_circle,
  ),
  'error': TypeAlertSnackBarEntity(
    label: 'Error',
    icon: Icons.error,
    color: Colors.red,
  ),
};

class SnackBarFloating {
  static Future<SnackBarClosedReason> show(
    BuildContext context,
    String message, {
    IconData? icon,
    TypeAlert type = TypeAlert.success,
    Color? backgroundColor,
    Duration? duration = const Duration(milliseconds: 4000),
  }) async {
    final typeAlert = _getTypeAlertSnackBar(type).copyWith(
      icon: icon,
      label: message,
      color: backgroundColor,
    );

    final snackBar = SnackBar(
      content: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Icon(
              typeAlert.icon,
              size: 22,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(typeAlert.label, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
      duration: duration!,
      backgroundColor: typeAlert.color,
      behavior: SnackBarBehavior.floating,
    );
    return await ScaffoldMessenger.of(context).showSnackBar(snackBar).closed;
  }

  static TypeAlertSnackBarEntity _getTypeAlertSnackBar(TypeAlert type) {
    switch (type) {
      case TypeAlert.error:
        return typeAlert['error']!;
      default:
        return typeAlert['success']!;
    }
  }
}
