import 'package:haraj_clone/src/app/generated/locator/locator.dart';
import 'package:haraj_clone/src/app/models/ad.model.dart';
import 'package:haraj_clone/src/app/services/api_service.dart';
import 'package:haraj_clone/src/ui/global/custom_base_view_model.dart';

class HomeViewModel extends CustomBaseViewModel {
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

  Future<void> getAds({int pageNumber = 1}) async {
    List<Ad> adsListFromApi = await _apiService.getAds(
      pageNumber: pageNumber,
    );
    _setAdsList(adsListFromApi);
  }
}
