import 'package:flutter/foundation.dart';
import 'package:haraj_clone/src/app/generated/locator/locator.dart';
import 'package:haraj_clone/src/app/services/url_launcher_service.dart';
import 'package:haraj_clone/src/ui/global/custom_base_view_model.dart';

class AdViewModel extends CustomBaseViewModel {
  final UrlLauncherService _urlLauncherService = locator<UrlLauncherService>();

  Future launchMobileNumber({@required String mobileNumber}) async {
    await _urlLauncherService.launchMobileNumber(
      mobileNumber: mobileNumber,
    );
  }
}
