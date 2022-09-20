import 'package:get/get.dart';
import 'package:kanoon_dadgostari/web_providers/api_endpoints.dart';
import 'package:kanoon_dadgostari/web_providers/api_provider.dart';

import '../../models/card/ban_rqm/ban_request_card_rqm.dart';
import '../../service/preferences_service.dart';

class CardAPI {
  final APIProvider _provider = Get.find();
  final LocalStorageService _pref = Get.find();

  Future banRequestCardApi(BanRequestCardRQM rqm) async {
    try {
      Map<String, dynamic> inputs = rqm.toJson();
      String url = APIEndpoint.urlCreator(
          APIControllers.admin, APIEndpoint.banCardRequest,
          id: _pref.user.lawyerProfile.toString(), version: '');
      // String url = 'https://lawyerb.gelareco.ir/api/admin/lawyers/cards/ban/1';
      var response = await _provider.postRequest(url, inputs);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future makeRequestCardApi() async {
    Map<String, dynamic> inputs = {};

    try {
      String url = APIEndpoint.urlCreator(
          APIControllers.admin, APIEndpoint.makeCardRequest,
          version: '', id: _pref.user.lawyerProfile.toString());
      var response = await _provider.postRequest(url, inputs);
      return response['data'];
    } catch (e) {
      rethrow;
    }
  }

  Future getCardListHistoryApi() async {
    Map<String, dynamic> inputs = {};

    try {
      String url = APIEndpoint.urlCreator(
          APIControllers.admin, APIEndpoint.getCardListHistory,
          id: _pref.user.lawyerProfile.toString(), version: '');
      var response = await _provider.getRequest(url, inputs);
      return response ;
    } catch (e) {
      rethrow;
    }
  }
}
