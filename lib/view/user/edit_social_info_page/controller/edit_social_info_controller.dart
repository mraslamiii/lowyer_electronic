import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../app/app_exeption.dart';
import '../../../../models/base/title_value_model.dart';
import '../../../../models/sec/lawyer_profile_model.dart';
import '../../../../repo/sec/lawyer_repo.dart';
import '../../../../service/connection_service/connection_status.dart';
import '../../../widgets/custom_snackbar/custom_snackbar.dart';

class EditSocialInfoController extends GetxController
    with StateMixin<LawyerProfileModel> {
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

  LawyerProfileModel? result;

  LawyersRepository repo = LawyersRepository();
  final ConnectionStatusController connectionStatusController =
      Get.put(ConnectionStatusController());

  Future<void> fetchData() async {
    if (!isBusyProfile.value) {
      try {
        isBusyProfile.value = true;
        change(null, status: RxStatus.loading());
        result = await repo.getLawyer('1');
        change(result, status: RxStatus.success());
        isBusyProfile.value = false;
        instagramTxtController.text = result?.instagram.trim() ?? ' ';
        whatsAppTxtController.text =
            result?.whatsApp.trim() ?? ' ';
        websiteTxtController.text =
            result?.webSite.trim() ?? '';
        officeAddressTxtController.text =
            result?.addressOffice.trim() ?? '';

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
}
