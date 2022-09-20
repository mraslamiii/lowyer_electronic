import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/card/card_list_request_model.dart';
import 'package:kanoon_dadgostari/repo/lawyer/card_repo.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/utilites/app_logger.dart';

class HistoryController extends GetxController with StateMixin<List<CardListRequestModel>> {
  late List<CardListRequestModel> rpm;

  final LocalStorageService pref = Get.find();
  final CardRepo _repo = CardRepo();

  Future fetchCardHistory() async {
    try {
      change(null,status: RxStatus.loading());
      rpm = await _repo.cardListDetail();
      if (rpm.isNotEmpty) {
        change(rpm,status: RxStatus.success());

      }  else{
        change([],status: RxStatus.empty());
      }

    } catch (e) {
      change(null,status: RxStatus.error());
      AppLogger.e('$e');
    }
  }
}
