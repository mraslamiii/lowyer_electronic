import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../repo/sec/auth_repo.dart';
import '../../../../service/preferences_service.dart';
import '../../../../utilites/app_logger.dart';

class HomeController extends GetxController {
  final AuthRepository repo = AuthRepository();
  final LocalStorageService pref= Get.find();

  Future fetchHomeData() async {
    try{
      bool result = await repo.fetchUser();
      update();
      return result;
    }catch(e){
      AppLogger.e('$e');
    }
  }
  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }

}



// Future getBasicData() async {
//   bool result = await _useCase.execute();
//
//
//   if (result == true) {
//     showError.value = false;
//   } else{
//     showError.value = true;
//   }
//
// }