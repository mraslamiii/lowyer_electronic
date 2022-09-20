import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/card/card_list_request_model.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/web_providers/lawyer_provider/ban_card_provider.dart';

import '../../models/card/ban_rqm/ban_request_card_rqm.dart';

class CardRepo {
  final LocalStorageService _pref = Get.find();

  Future cardBanRequest(BanRequestCardRQM rqm) async {
    try {
      Map<String, dynamic> response = await CardAPI().banRequestCardApi(rqm);
      _pref.setLawyer(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future cardListDetail() async {
    try {
     var response = await CardAPI().getCardListHistoryApi();
     CardHistoryModel result =
         CardHistoryModel.fromJson(response);
      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  Future cardMakeRequest() async {
    try {
      var response = await CardAPI().makeRequestCardApi();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
