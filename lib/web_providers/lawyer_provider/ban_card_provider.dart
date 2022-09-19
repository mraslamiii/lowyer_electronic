import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/base/base_response.dart';
import 'package:kanoon_dadgostari/models/lawyer/lawyer_rqm/ban_request_card_rqm.dart';
import 'package:kanoon_dadgostari/web_providers/api_endpoints.dart';
import 'package:kanoon_dadgostari/web_providers/api_provider.dart';

import '../../service/preferences_service.dart';

class CardAPI {
  final APIProvider _provider = Get.find();
  final LocalStorageService _pref = Get.find();

  Future banRequestCard(BanRequestCardRQM rqm) async {
    try {
      Map<String, dynamic> inputs = rqm.toJson();
      String url = APIEndpoint.urlCreator(
          APIControllers.admin, APIEndpoint.banCardRequest,
          id: _pref.user.lawyerProfile.toString(), version: '');
      // String url = 'https://lawyerb.gelareco.ir/api/admin/lawyers/cards/ban/1';
      var response = await _provider.postRequest(url, inputs);
      return response['data'];
    } catch (e) {
      rethrow;
    }
  }

  Future makeRequestCard() async {
    Map<String, dynamic> inputs = {};

    try {
      String url = APIEndpoint.urlCreator(
          APIControllers.admin, APIEndpoint.makeCardRequest, version: '', id
              : _pref.user.lawyerProfile.toString() );
      var response = await _provider.postRequest(url, inputs);
      return response['data'];
    }catch(e){
    rethrow;
    }
  }
}
