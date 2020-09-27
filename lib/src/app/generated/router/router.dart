import 'package:auto_route/auto_route_annotations.dart';
import 'package:haraj_clone/src/ui/views/ad/ad_view.dart';
import 'package:haraj_clone/src/ui/views/startup/startup_view.dart';
import 'package:haraj_clone/src/ui/views/home/home_view.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView, path: '/', initial: true),
    AdaptiveRoute(page: HomeView, path: '/home'),
    AdaptiveRoute(page: AdView, path: '/ad'),
  ],
)
class $Router {}
