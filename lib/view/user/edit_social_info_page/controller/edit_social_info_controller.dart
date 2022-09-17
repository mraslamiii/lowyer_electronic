import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';

import '../../../../models/sec/edit_social_rqm.dart';
import '../../../../models/sec/info_profile_model.dart';
import '../../../../repo/sec/lawyer_repo.dart';
import '../../../../service/connection_service/connection_status.dart';
import '../../../../utilites/app_logger.dart';

class EditSocialInfoController extends GetxController {
  final LocalStorageService pref = Get.find<LocalStorageService>();

  RxBool isBusySocial = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    websiteTxtController.dispose();
    instagramTxtController.dispose();
    whatsAppTxtController.dispose();
    super.onClose();
  }

  TextEditingController instagramTxtController = TextEditingController();
  TextEditingController whatsAppTxtController = TextEditingController();
  TextEditingController websiteTxtController = TextEditingController();

  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }

  InfoProfileModel? result;

  LawyersRepository repo = LawyersRepository();
  final ConnectionStatusController connectionStatusController =
      Get.put(ConnectionStatusController());

  Future editSocialMedia() async {
    try {
      if (isBusySocial.value == false) {
        isBusySocial.value = true;
        update();
        result = await repo.editSocial(EditSocialRQM(
            webSite: websiteTxtController.text,
            instagram: instagramTxtController.text,
            whatsApp: whatsAppTxtController.text));
        isBusySocial.value = false;
        update();
        Get.back(result: 'result');
      }
    } catch (e) {
      isBusySocial.value = false;
      update();
      AppLogger.e('$e');
    }
  }

/*
  Future<void> fetchData() async {
    if (!isBusyProfile.value) {
      try {
        isBusyProfile.value = true;
        change(null, status: RxStatus.loading());
        result = await repo.getLawyer('${pref.user.lawyerProfile}');
        change(result, status: RxStatus.success());
        isBusyProfile.value = false;
        instagramTxtController.text = result?.data.profile.instagram.trim() ?? ' ';
        whatsAppTxtController.text =
            result?.data.profile.whatsApp.trim() ?? ' ';
        websiteTxtController.text =
            result?.data.profile.webSite.trim() ?? '';
        officeAddressTxtController.text =
            result?.data.user.address.trim() ?? '';

        // Get.offAllNamed(Routes.homePage);
      } on TitleValueException catch (exp) {
        for (TitleValueModel error in exp.errors) {
          isBusyProfile.value = false;
          exeptionSnackBar(error.value![0]);
        }
      } catch (e) {
        isBusyProfile.value = false;
        change(null, status: RxStatus.error('e'));

        rethrow;
      }
    } else {
      change(null, status: RxStatus.error('e'));
      isBusyProfile.value = false;
    }
  }
*/
// Future changeSocialData()async {
// try{
//   result = await repo.getLawyer(id);
//
// }catch(e){
//   AppLogger.e('$e');
// }
// }
}
