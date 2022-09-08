import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_pages.dart';
import '../../../../service/preferences_service.dart';

class LoginController extends GetxController {
  /// Variable ///

  TextEditingController phoneTxtController = TextEditingController();

  RxString phoneNumber = RxString('');
  RxnString errorText = RxnString(null);
  RxBool isValid = RxBool(false);
  final LocalStorageService pref = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
    debounce<String>(phoneNumber, validations,
        time: const Duration(milliseconds: 500));
  }

  void phoneChanged(String val) {
    phoneNumber.value = val;
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
    Get.defaultDialog(title: "انصراف از ادامه",content: const Text("برای لغو فرایند ورود مطمئن هستید؟"));
    return true;
  }



}
