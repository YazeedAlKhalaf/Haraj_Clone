import 'package:flutter/foundation.dart';
import 'package:haraj_clone/src/app/generated/locator/locator.dart';
import 'package:haraj_clone/src/app/generated/router/router.gr.dart';
import 'package:haraj_clone/src/app/models/ad.model.dart';
import 'package:haraj_clone/src/app/services/api_service.dart';
import 'package:haraj_clone/src/ui/global/custom_base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService _apiService = locator<ApiService>();

  List<Ad> _adsList = <Ad>[];
  List<Ad> get adsList => _adsList;
  void _setAdsList(List<Ad> newValue) {
    _adsList = newValue;
    notifyListeners();
  }

  void _addToAdsList(Ad newAd) {
    _adsList.add(newAd);
    notifyListeners();
  }

  int _currentRightSideIndex = 0;
  int get currentRightSideIndex => _currentRightSideIndex;
  void setCurrentRightSideIndex(int newValue) {
    _currentRightSideIndex = newValue;
    notifyListeners();
  }

  Future<void> getAds({int pageNumber = 1}) async {
    setBusy(true);
    List<Ad> adsListFromApi = await _apiService.getAds(
      pageNumber: pageNumber,
    );
    _setAdsList(adsListFromApi);
    setBusy(false);
  }

  Future<void> navigateToAdView({
    @required Ad ad,
  }) async {
    await _navigationService.navigateTo(
      Routes.adView,
      arguments: AdViewArguments(
        ad: ad,
      ),
    );
  }
}
