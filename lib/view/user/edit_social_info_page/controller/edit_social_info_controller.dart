import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';

import '../../../../models/sec/info_profile_model.dart';
import '../../../../repo/sec/lawyer_repo.dart';
import '../../../../service/connection_service/connection_status.dart';

class EditSocialInfoController extends GetxController
    with StateMixin<InfoProfileModel> {
  final LocalStorageService pref = Get.find<LocalStorageService>();

  RxBool isBusyProfile = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  TextEditingController instagramTxtController = TextEditingController();
  TextEditingController whatsAppTxtController = TextEditingController();
  TextEditingController websiteTxtController = TextEditingController();
  TextEditingController officeAddressTxtController = TextEditingController();

  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }

  InfoProfileModel? result;

  LawyersRepository repo = LawyersRepository();
  final ConnectionStatusController connectionStatusController =
      Get.put(ConnectionStatusController());

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
