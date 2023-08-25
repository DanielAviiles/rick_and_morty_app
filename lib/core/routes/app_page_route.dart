import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/routes/app_routes.dart';

mixin AppPagesRoute {
  static Widget? activityPage;

  static Widget? buildScreenPage(String? route) {
    switch (route) {
      case AppRoutes.home:
        return const SizedBox();
      default:
        return Container();
    }
  }

  static Map<String, Widget Function(BuildContext)> getRoutes() =>
      <String, Widget Function(BuildContext)>{
        AppRoutes.home: (BuildContext context) =>
            buildScreenPage(AppRoutes.home)!,
      };
}
