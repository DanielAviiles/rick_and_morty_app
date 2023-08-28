import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/routes/app_routes.dart';
import 'package:rick_and_morty_app/features/home/presentation/screens/home_screen.dart';
import 'package:rick_and_morty_app/features/menu_structure/presentation/bloc/menu_structure_bloc.dart';

class AppPagesRoute {
  static Widget? buildScreenPage(String? route) {
    switch (route) {
      case AppRoutes.home:
        return MultiBlocProvider(
          providers: [
            BlocProvider<MenuStructureBloc>(create: (_) => MenuStructureBloc()),
          ],
          child: const HomeScreen(),
        );
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
