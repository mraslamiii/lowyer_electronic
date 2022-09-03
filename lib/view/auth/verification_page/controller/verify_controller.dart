import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/models/user.dart';
import 'package:lottie/lottie.dart';

import '../../../../res/colors/colors.dart';
import '../../../../res/dimens/dimens.dart';

class VerifyController extends GetxController {
  TextEditingController pinController = TextEditingController();
  RxString value = RxString('');
  RxBool isValid = RxBool(false);

  void phoneChanged(String val) {
    value.value = val;
  }

  @override
  void onInit() {
    super.onInit();
    debounce<String>(value, lengthOK, time: const Duration(milliseconds: 500));
  }

  void lengthOK(String vale) {
    if (pinController.text.length < 5) {
      isValid.value = false;
    } else {
      isValid.value = true;
    }
  }

  Future<bool> back() async {
    bool isBack = false;
    Get.defaultDialog(
      barrierDismissible: true,
      textCancel: "خیر",
      textConfirm: "بله",

      title: "انصراف از ادامه",
      titleStyle:
          Get.theme.textTheme.subtitle2,
      content: Column(
        children: [
          SizedBox(
              width: fullWidth / 5,
              height: fullWidth / 5,
              child: Lottie.asset('assets/icons/close.json')),
          Padding(
            padding:  EdgeInsets.only(top: smallSize),
            child: Text("برای لغو فرایند ورود مطمئن هستید؟",
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
}
