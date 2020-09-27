import 'package:flutter/material.dart';
import 'package:haraj_clone/src/app/generated/locator/locator.dart';
import 'package:haraj_clone/src/app/generated/router/router.gr.dart' as RouterGR;
import 'package:stacked_services/stacked_services.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "haraj_clone",
      initialRoute: RouterGR.Routes.startupView,
      onGenerateRoute: RouterGR.Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}