import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/app/di/injection.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/application/querys/get_character_usecase.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/ui/bloc/detail_character_bloc.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/ui/detail_character_page.dart';
import 'package:rick_and_morty_app/app/modules/home/application/querys/get_characters_usecase.dart';
import 'package:rick_and_morty_app/app/modules/home/ui/bloc/home_bloc.dart';
import 'package:rick_and_morty_app/app/modules/home/ui/home_page.dart';
import 'package:rick_and_morty_app/app/routes/app_routes.dart';

mixin AppPagesRoute {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return <String, Widget Function(BuildContext)>{
      AppRoutes.home: (BuildContext context) => BlocProvider<HomeBloc>(
            child: const HomePage(),
            create: (context) => HomeBloc(
                getCharactersUseCase: getItApp<GetCharactersUseCase>()),
          ),
      AppRoutes.detail_character: (BuildContext context) =>
          BlocProvider<DetailCharacterBloc>(
            child: const DetailCharacterPage(),
            create: (context) => DetailCharacterBloc(
                getCharacterUseCase: getItApp<GetCharacterUseCase>()),
          ),
    };
  }

  static BlocProvider<T> getInstanceBloc<T extends BlocBase<dynamic>>(
      BuildContext context,
      {Widget? widget}) {
    return BlocProvider<T>.value(
      value: BlocProvider.of<T>(context),
      child: widget,
    );
  }

  static void navigateWithBloc<T extends BlocBase<dynamic>>(
      BuildContext context, Widget widget) {
    Navigator.push<T>(
      context,
      MaterialPageRoute<T>(
        builder: (BuildContext contextBuild) {
          return getInstanceBloc<T>(context, widget: widget);
        },
      ),
    );
  }

  static void navigateAndReplaceWithBloc<T extends BlocBase<dynamic>>(
      BuildContext context, Widget widget) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<T>(
        builder: (BuildContext contextBuild) {
          return getInstanceBloc<T>(context, widget: widget);
        },
      ),
    );
  }

  static void navigateMultiBloc(BuildContext context, Widget widget,
      List<BlocProvider<dynamic>> blocProviderList) {
    Navigator.push<MultiBlocProvider>(
      context,
      MaterialPageRoute<MultiBlocProvider>(
        builder: (BuildContext contextBuild) {
          return MultiBlocProvider(
            providers: blocProviderList,
            child: widget,
          );
        },
      ),
    );
  }
}
