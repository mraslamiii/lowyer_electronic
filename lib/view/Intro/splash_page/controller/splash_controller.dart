import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/utilites/app_logger.dart';

import '../../../../repo/base/splash_repo.dart';

class SplashController extends GetxController {
  final LocalStorageService pref = Get.find<LocalStorageService>();
  RxBool isProgress = true.obs;

  @override
  Future<void> onReady() async {
    await Future.delayed(const Duration(milliseconds: 4000));
    isProgress.value = false;
    update();
    controlNavigation();
    if (pref.user.lawyerProfile != null) {
      getBasicData();
    }
    super.onReady();
  }

  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }

  void controlNavigation() async {
    try {
      // Get.offAllNamed(Routes.loginPage);

      if (pref.isFirstTimeLaunch) {
        Get.offNamed(Routes.loginPage);
      } else if (pref.token != "") {
        Get.toNamed(Routes.homePage);
        // await _navigationService.pushNamedAndRemoveUntil(Routes.loginPage);
      } else if(pref.token == ''){
        Get.toNamed(Routes.loginPage);
        // _navigationService.pushNamedAndRemoveUntil(Routes.mainPage,
        //     arguments: MainPageArguments(selectedIndex: 0));
      }
    } catch (e) {
      AppLogger.e('$e');
    }
  }
}

SplashRepository repository = SplashRepository();

Future getBasicData() async {
  bool result = await repository.syncApp();
  return result;
}
