import 'package:haraj_clone/src/app/models/ad.model.dart';
import 'package:haraj_clone/src/app/models/ads_list_response.model.dart';
import 'package:haraj_clone/src/app/utils/logger.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class ApiService {
  final Logger _logger = getLogger('ApiService');

  final String baseUrl = "https://api.haraj.com";
  final Client client = Client();

  Future getAds({
    int pageNumber = 1,
  }) async {
    try {
      List<Ad> adsList = <Ad>[];
      Response response = await client.get(
        "$baseUrl/ios-gw/iphone/readmain.php?accesstype=read&page=$pageNumber",
      );

      AdsListResponse adsListResponse = AdsListResponse.fromJson(
        response.body,
      );

      adsList.addAll(adsListResponse.ads);
      return adsList;
    } catch (error) {
      _logger.e(error.toString());
    }
  }
}
