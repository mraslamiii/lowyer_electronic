import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:lottie/lottie.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../app/app_pages.dart';

class SignUPController extends GetxController {
  TextEditingController idCodeUserController = TextEditingController();
  TextEditingController dateTimeTxtController = TextEditingController();
  TextEditingController phoneTxtController = TextEditingController();
  LocalStorageService pref = Get.find<LocalStorageService>();

  RxString idCodeNumber = RxString('');
  RxString dateTimeTxt = RxString('');
  RxnString errorCodeNumber = RxnString(null);
  RxBool idIsValid = RxBool(false);
  RxBool dateIsValid = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    phoneTxtController.text = pref.phoneNumber;
    debounce<String>(idCodeNumber, validations,
        time: const Duration(milliseconds: 500));

    debounce<String>(dateTimeTxt, validationsDte,
        time: const Duration(milliseconds: 500));
  }

  void valueChanged(String val) {
    idCodeNumber.value = val;
  }

  void validations(String val) async {
    errorCodeNumber.value = null; // reset validation errors to nothing
    idIsValid.value = false;

    if (val.isNotEmpty) {
      if (lengthOK(val)) {
        idIsValid.value = true;
        errorCodeNumber.value = null;
      }
    }
  }

  void validationsDte(String val) async {
    if (val.isNotEmpty) {
      if (dateTimeTxtController.text.isNotEmpty) {
        dateIsValid.value = true;
      }
    }
  }

  bool lengthOK(String val, {int minLen = 10}) {
    if (val.length < minLen) {
      errorCodeNumber.value = 'کد ملی باید 10 رقم باشد';
      return false;
    } else {
      return true;
    }
  }

  void submitFunc() {
    if (lengthOK(idCodeNumber.value) && dateTimeTxt.value.isNotEmpty) {
      Get.offAllNamed(Routes.verifyDetails);
    }
  }

  Future<bool> back() async {
    bool isBack = false;
    Get.defaultDialog(
      barrierDismissible: true,
      textCancel: "خیر",
      textConfirm: "بله",
      title: "انصراف از ثبت نام",
      titleStyle: Get.theme.textTheme.subtitle2,
      content: Column(
        children: [
          SizedBox(
              width: fullWidth / 5,
              height: fullWidth / 5,
              child: Lottie.asset('assets/icons/close.json')),
          Padding(
            padding: EdgeInsets.only(top: smallSize),
            child: Text("برای لغو فرایند ثبت نام مطمئن هستید؟",
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.bodyText1),
          ),
        ],
      ),
      onCancel: () {
        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
      },
      onConfirm: () {
        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();

        Get.offAllNamed(Routes.loginPage);
      },
    );
    return isBack;
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
      dateTimeTxt.value = "${picked.formatFullDate()} ";
      dateTimeTxtController.text = "${picked.formatFullDate()} ";
    }
  }
}
