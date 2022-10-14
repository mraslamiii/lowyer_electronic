import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_exeption.dart';
import 'package:kanoon_dadgostari/models/base/title_value_model.dart';
import 'package:kanoon_dadgostari/repo/sec/auth_repo.dart';
import 'package:kanoon_dadgostari/service/connection_service/connection_status.dart';
import 'package:kanoon_dadgostari/enums/result_enum.dart';
import 'package:kanoon_dadgostari/utilites/show_result.dart';
import 'package:kanoon_dadgostari/view/widgets/custom_snackbar/custom_snackbar.dart';

import '../../../../app/app_pages.dart';
import '../../../../enums/snackbar_type.dart';
import '../../../../service/preferences_service.dart';

class LoginController extends GetxController {
  /// Variable ///

  TextEditingController phoneTxtController = TextEditingController();

  RxString phoneNumber = RxString('');
  RxnString errorText = RxnString(null);
  RxBool isValid = RxBool(false);
  final LocalStorageService pref = Get.find<LocalStorageService>();
  final ConnectionStatusController connectionStatusController =
      Get.find<ConnectionStatusController>();
  AuthRepository repo = AuthRepository();

  RxBool isBusyLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    debounce<String>(phoneNumber, validations,
        time: const Duration(milliseconds: 500));
  }

  void phoneChanged(String val) {
    phoneNumber.value = val;
  }

  Future<void> fetchData() async {
    if (isBusyLogin.isFalse &&
        connectionStatusController.connectionStatus ==
            ConnectionStatus.connect) {
      try {
        isBusyLogin.value = true;

        var result = await repo.loginRequest(phoneNumber.value);
        isBusyLogin.value = false;
        if (result != null) {
          Get.offAllNamed(Routes.verificationPage,
              arguments: phoneNumber.value);
          showTheResult(
              resultType: SnackbarType.success,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'موفقیت',
              message: 'کد به شماره $result ارسال شد');//todo check

        }
      }
      on TitleValueException catch (exp) {

        for (TitleValueModel error in exp.errors){
          isBusyLogin.value = false;
          Get.toNamed(Routes.signupPage, arguments: phoneNumber.value);

        }

      }
      catch (e) {
        isBusyLogin.value = false;
        update();
        Get.toNamed(Routes.signupPage, arguments: phoneNumber.value);

        // showTheResult(
        //     resultType: SnackbarType.error,
        //     showTheResultType: ShowTheResultType.snackBar,
        //     title: 'خطا',
        //     message: '$e');
      }
    } else {
      isBusyLogin.value = false;
    }
  }

  void validations(String val) async {
    errorText.value = null; // reset validation errors to nothing
    isValid.value = false;

    if (val.isNotEmpty) {
      if (lengthOK(val) && isPhone(val)) {
        isValid.value = true;
        errorText.value = null;
      }
    }
  }

  bool isPhone(String val) {
    if (val.startsWith("09")) {
      return true;
    } else {
      errorText.value = 'شماره تلفن معتبر نمیباشد';

      return false;
    }
  }

  bool lengthOK(String val, {int minLen = 11}) {
    if (val.length < minLen) {
      errorText.value = 'شماره تلفن باید 11 رقم باشد';
      return false;
    } else {
      return true;
    }
  }

  void submitFunction() {
    pref.phoneNumber = phoneNumber.value;
    Get.offNamed(Routes.verificationPage);
  }

  Future<bool> back() async {
    Get.defaultDialog(
        title: "انصراف از ادامه",
        content: const Text("برای لغو فرایند ورود مطمئن هستید؟"));
    return true;
  }
}
