import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/repo/sec/auth_repo.dart';
import 'package:kanoon_dadgostari/service/connection_service/connection_status.dart';

import '../../../../enums/snackbar_type.dart';
import '../../../../service/preferences_service.dart';
import '../../../../enums/result_enum.dart';
import '../../../../utilites/app_logger.dart';
import '../../../../utilites/show_result.dart';

class VerifyController extends GetxController {
  TextEditingController pinController = TextEditingController();

  var result ;
  RxString value = RxString('');
  RxBool isValid = RxBool(false);
  RxBool isBusyLogin = false.obs;
  AuthRepository repo = AuthRepository();
  final LocalStorageService _pref = Get.find<LocalStorageService>();
  final ConnectionStatusController connectionStatusController = Get.find<ConnectionStatusController>();

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
