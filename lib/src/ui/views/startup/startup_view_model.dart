import 'dart:async';

import 'package:haraj_clone/src/app/generated/locator/locator.dart';
import 'package:haraj_clone/src/app/generated/router/router.gr.dart';
import 'package:haraj_clone/src/ui/global/custom_base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Future handleStartup() async {
    // Do Some Logic Here
    // The timer is a placeholder, but the view needs to be viewed at least for a second!
    Timer(
      Duration(
        seconds: 2,
      ),
      () async => await navigateToHomeView(),
    );
  }

  Future navigateToHomeView() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }
}