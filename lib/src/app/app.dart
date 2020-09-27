import 'package:flutter/material.dart';
import 'package:haraj_clone/src/app/generated/locator/locator.dart';
import 'package:haraj_clone/src/app/generated/router/router.gr.dart'
    as RouterGR;
import 'package:haraj_clone/src/app/services/shared_prefs/theme_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeModeHandler(
      manager: ThemeModeService(),
      builder: (ThemeMode themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Haraj Clone",
          initialRoute: RouterGR.Routes.startupView,
          onGenerateRoute: RouterGR.Router().onGenerateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
          themeMode: themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.white,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
        );
      },
    );
  }
}
