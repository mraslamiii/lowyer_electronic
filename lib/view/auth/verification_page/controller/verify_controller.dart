import 'dart:async';

import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/repo/sec/auth_repo.dart';
import 'package:kanoon_dadgostari/service/connection_service/connection_status.dart';

import '../../../../app/app_exeption.dart';
import '../../../../enums/snackbar_type.dart';
import '../../../../models/base/title_value_model.dart';
import '../../../../service/preferences_service.dart';
import '../../../../enums/result_enum.dart';
import '../../../../utilites/app_logger.dart';
import '../../../../utilites/show_result.dart';

class VerifyController extends GetxController {
  TextEditingController pinController = TextEditingController();

  var result ;
  RxBool isBusyConfirmationCode = false.obs;
  late CountDown countDownTime;
  late StreamSubscription<Duration> subTime;
  RxString time = "".obs;

  RxString value = RxString('');
  RxBool isValid = RxBool(false);
  RxBool isBusyLogin = false.obs;
  AuthRepository repo = AuthRepository();
  final LocalStorageService _pref = Get.find<LocalStorageService>();
  final ConnectionStatusController connectionStatusController = Get.find<ConnectionStatusController>();

  /// Count down time ///

  String showTime(Duration event) {
    var min = "";

    var sec = "";

    var secs = event.inSeconds % 60;

    if (event.inMinutes < 10) {
      min = "0${event.inMinutes}";
    } else {
      min = "${event.inMinutes}";
    }

    if (secs < 10) {
      sec = "0${event.inSeconds % 60}";
    } else {
      sec = (event.inSeconds % 60).toString();
    }

    return min + ":" + sec;
  }

  void countListener() {
    countDownTime = CountDown(const Duration(minutes: 2));

    subTime = countDownTime.stream.listen((event) {
      time.value = showTime(event);

      update();
    });

    subTime.onDone(() {
      isBusyConfirmationCode.value = false;

      subTime.cancel();

      update();

      debugPrint("subTime.onDone");
    });
  }

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

  Future fetchHomeData() async {
    try {
      bool result = await repo.fetchUser();
      update();
      return result;
    } catch (e) {
      AppLogger.e('$e');
    }
  }

  Future<void> fetchData(String phone ) async {
    if (isBusyLogin.isFalse  && connectionStatusController.connectionStatus == ConnectionStatus.connect) {
      try {
        isBusyLogin.value = true;

        result = await repo.loginCodeRequest(phone, pinController.text);
        isBusyLogin.value = false;
        _pref.token = result.token;
        _pref.setUser(result.user!.toJson());
        showTheResult(resultType: SnackbarType.success,
            showTheResultType: ShowTheResultType.snackBar,
            title: 'موفقیت',
            message: 'با موفقیت وارد شدید');

        Get.offAllNamed(Routes.homePage);
        update();
        // fetchHomeData();
      } catch (e) {
        isBusyLogin.value = false;
        showTheResult(resultType: SnackbarType.error,
            showTheResultType: ShowTheResultType.snackBar,
            title: 'خطا',
            message: '$e');

        rethrow;
      }
    } else {
      isBusyLogin.value = false;
    }
  }


  Future<void> resendCode(String phoneNumber) async {
    if (isBusyConfirmationCode.isFalse &&
        connectionStatusController.connectionStatus ==
            ConnectionStatus.connect) {
      try {
        isBusyConfirmationCode.value = true;

        var result = await repo.loginRequest(phoneNumber);
        isBusyConfirmationCode.value = false;
        if (result == null) {
          Get.offAllNamed(Routes.signupPage, arguments: phoneNumber);
          showTheResult(
              resultType: SnackbarType.error,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'خطا',
              message: "تلفن همراه مورد نظر معتبر نیست");//todo check

        } else {
          showTheResult(
              resultType: SnackbarType.success,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'موفقیت',
              message: 'کد به شماره $result ارسال شد');
          countListener();
        }
      }
      on TitleValueException catch (exp) {

        for (TitleValueModel error in exp.errors){
          isBusyConfirmationCode.value = false;
          Get.toNamed(Routes.signupPage, arguments: phoneNumber);

        }

      }
      catch (e) {
        isBusyConfirmationCode.value = false;
        update();
        Get.toNamed(Routes.signupPage, arguments: phoneNumber);
        // showTheResult(
        //     resultType: SnackbarType.error,
        //     showTheResultType: ShowTheResultType.snackBar,
        //     title: 'خطا',
        //     message: '$e');
      }
    } else {
      isBusyConfirmationCode.value = false;
    }
  }
// Future<bool> back() async {
//   bool isBack = false;
//   Get.defaultDialog(
//     barrierDismissible: true,
//     textCancel: "خیر",
//     textConfirm: "بله",
//
//     title: "انصراف از ادامه",
//     titleStyle:
//         Get.theme.textTheme.subtitle2,
//     content: Column(
//       children: [
//         SizedBox(
//             width: fullWidth / 5,
//             height: fullWidth / 5,
//             child: Lottie.asset('assets/icons/close.json')),
//         Padding(
//           padding:  EdgeInsets.only(top: smallSize),
//           child: Text("برای لغو فرایند ورود مطمئن هستید؟",
//               textAlign: TextAlign.center,
//               style: Get.theme.textTheme.bodyText1),
//         ),
//       ],
//     ),
//     onCancel: () {
//       Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
//     },
//     onConfirm: () {
//       Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
//
//       Get.offAllNamed(Routes.loginPage);
//     },
//   );
//   return isBack;
// }

}
