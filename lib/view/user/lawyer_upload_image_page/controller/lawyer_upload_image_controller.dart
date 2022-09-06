import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';

class LawyerUploadImageController extends GetxController {
  final LocalStorageService pref = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
  }



  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }
}
