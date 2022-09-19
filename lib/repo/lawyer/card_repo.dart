import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/lawyer/lawyer_rqm/ban_request_card_rqm.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/web_providers/lawyer_provider/ban_card_provider.dart';


class CardRepo {
  final LocalStorageService _pref = Get.find();
  Future cardBanRequest(BanRequestCardRQM rqm) async {
    try {
      var response = await CardAPI().banRequestCard(rqm);
      _pref.setLawyer(response['data']);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future cardMakeRequest() async {
    try {
      var response = await CardAPI().makeRequestCard();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
