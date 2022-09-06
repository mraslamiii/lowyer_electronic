import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class EditProfileController extends GetxController {
  final LocalStorageService pref = Get.find<LocalStorageService>();


  @override
  void onInit() {
    super.onInit();
  }

  TextEditingController nameTxtController = TextEditingController();
  TextEditingController lastNameTxtController = TextEditingController();
  TextEditingController fatherNameTxtController = TextEditingController();
  TextEditingController nationalCodeTxtController = TextEditingController();
  TextEditingController addressTxtController = TextEditingController();
  TextEditingController zipCodeTxtController = TextEditingController();


  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }


}