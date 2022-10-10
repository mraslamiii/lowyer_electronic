import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/enums/snackbar_type.dart';
import 'package:kanoon_dadgostari/models/lawyer/info_profile_model.dart';
import 'package:kanoon_dadgostari/models/card/ban_rqm/ban_request_card_rqm.dart';
import 'package:kanoon_dadgostari/repo/lawyer/card_repo.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/enums/result_enum.dart';
import 'package:kanoon_dadgostari/utilites/show_result.dart';

import '../../../../utilites/app_logger.dart';

class LawyerController extends GetxController{
  @override
  void onClose() {
    super.onClose();
  }

  Rx<double> heightCard = 200.0.obs;
  ScrollController controller = ScrollController();
  LocalStorageService pref = Get.find();
  late LawyerData lawyer;

  @override
  void onInit() {
    super.onInit();

    lawyer = pref.lawyer;
    changeSize();
  }

  RxBool hasActiveCard = true.obs;
  RxBool sh = false.obs;
  CardRepo repo = CardRepo();
  RxBool isBusyBan = false.obs;
  RxBool requestNewCard = false.obs;

  Future banCardRequest() async {
    try {
      if (isBusyBan.value == false) {
        isBusyBan.value = true;
        update();
        BanRequestCardRQM rqm = BanRequestCardRQM(description: 'desc');
        var result = await repo.cardBanRequest(rqm);
        if (result != null) {
          hasActiveCard.value = false;
          isBusyBan.value = false;
          update();
          showTheResult(
              resultType: SnackbarType.success,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'موفقیت',
              message: 'درخواست شما با موفقیت ثبت شد');
        } else {
          isBusyBan.value = false;
          update();
          showTheResult(
              resultType: SnackbarType.error,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'Error',
              message: 'خطایی رخ داده است');

          update();
        }
      }
    } catch (e) {
      isBusyBan.value = false;
      update();
      showTheResult(
          resultType: SnackbarType.error,
          showTheResultType: ShowTheResultType.snackBar,
          title: 'خطا',
          message: '$e');

      AppLogger.e('$e');
    }
  }

  Future makeRequest() async {
    try {
      if (requestNewCard.value == false) {
        requestNewCard.value = true;
        update();
        var result = await repo.cardMakeRequest();
        if (result != null) {
          requestNewCard.value = false;
          update();
          showTheResult(
              resultType: SnackbarType.success,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'Success',
              message: 'درخواست شما با موفقیت ثبت شد');
        } else {
          requestNewCard.value = false;
          update();

          showTheResult(
              resultType: SnackbarType.error,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'Error',
              message: result.toString()); //todo fix error
        }
      }
    } catch (e) {
      requestNewCard.value = false;
      update();
      showTheResult(
          resultType: SnackbarType.error,
          showTheResultType: ShowTheResultType.snackBar,
          title: 'Error',
          message: '$e');
      AppLogger.e('$e');
    }
  }

  void changeSize() {
    controller.addListener(() {
      if (controller.positions.first.userScrollDirection ==
          ScrollDirection.reverse) {
        heightCard.value = 100;
      } else {
        heightCard.value = 200;
      }
    });
  }
}
