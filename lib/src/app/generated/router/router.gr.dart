// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/views/ad/ad_view.dart';
import '../../../ui/views/home/home_view.dart';
import '../../../ui/views/startup/startup_view.dart';
import '../../models/ad.model.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home';
  static const String adView = '/ad';
  static const all = <String>{
    startupView,
    homeView,
    adView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.adView, page: AdView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    AdView: (data) {
      final args = data.getArgs<AdViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AdView(
          key: args.key,
          ad: args.ad,
          showAppBar: args.showAppBar,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AdView arguments holder class
class AdViewArguments {
  final Key key;
  final Ad ad;
  final bool showAppBar;
  AdViewArguments({this.key, @required this.ad, this.showAppBar = true});
}
