import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rick_and_morty_app/core/injection/injection_container.dart';
import 'package:rick_and_morty_app/core/routes/app_page_route.dart';
import 'package:rick_and_morty_app/core/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return ResponsiveSizer(
      builder: (_, orientation, screenType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marvel Characters - Mobile',
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(color: Color.fromRGBO(25, 30, 56, 1)),
        ),
        routes: AppPagesRoute.getRoutes(),
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
