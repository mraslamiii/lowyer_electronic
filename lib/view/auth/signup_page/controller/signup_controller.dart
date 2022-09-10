import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_exeption.dart';
import 'package:kanoon_dadgostari/models/base/title_value_model.dart';
import 'package:kanoon_dadgostari/models/sec/user_model.dart';
import 'package:kanoon_dadgostari/repo/sec/auth_repo.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/service/connection_service/connection_status.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/web_models/auth/auth_web_model.dart';
import 'package:lottie/lottie.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../app/app_pages.dart';
import '../../../widgets/custom_snackbar/custom_snackbar.dart';

class SignUPController extends GetxController {
  TextEditingController idCodeUserController = TextEditingController();
  TextEditingController dateTimeTxtController = TextEditingController();
  TextEditingController phoneTxtController = TextEditingController();
  TextEditingController nameTxtController = TextEditingController();
  TextEditingController lastNameTxtController = TextEditingController();

  final LocalStorageService pref = Get.find<LocalStorageService>();
  final ConnectionStatusController connectionStatusController =
      Get.find<ConnectionStatusController>();
  AuthRepository repo = AuthRepository();

  RxBool isBusyLogin = false.obs;

  Future<void> fetchData(String phone) async {
    if (isBusyLogin.isFalse &&
        connectionStatusController.connectionStatus ==
            ConnectionStatus.connect) {
      try {
        isBusyLogin.value = true;

        var result = await repo.registerRequest(RegisterRQM(
            firstName: nameTxtController.text,
            lastName: lastNameTxtController.text,
            mobileNumber: phone,
            nationalCode: idCodeUserController.text));
        isBusyLogin.value = false;

        pref.setUser(result.user!.toJson());

        Get.offAllNamed(Routes.verifyDetails);
      } on TitleValueException catch (exp) {
        for (TitleValueModel error in exp.errors) {
          isBusyLogin.value = false;
          exeptionSnackBar(error.value![0]);
        }
      } catch (e) {
        isBusyLogin.value = false;

        rethrow;
      }
    } else {
      isBusyLogin.value = false;
    }
  }



  void showDatePicker(BuildContext context) async {
    Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1320, 8),
      lastDate: Jalali(1450, 9),
      textDirection: TextDirection.rtl,
      initialDatePickerMode: PDatePickerMode.day,
    );
    if (picked != null) {
      // dateTimeTxt.value = "${picked.formatFullDate()} ";
      dateTimeTxtController.text = "${picked.formatFullDate()} ";
    }
  }
}
