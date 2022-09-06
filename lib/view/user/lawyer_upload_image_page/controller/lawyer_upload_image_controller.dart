import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';

class LawyerUploadImageController extends GetxController {
  final LocalStorageService pref = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
  }

  Rx<File> lawyerFile = File('').obs;
  Rx<File> identityFile = File('').obs;
  Rx<File> frontNationalCardFile = File('').obs;
  Rx<File> backNationalCardFile = File('').obs;


  Future<void> openGallery(Rx<File> file) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    file.value = File(pickedFile?.path ?? "");

    final fileCropped = await ImageCropper().cropImage(sourcePath: pickedFile?.path ?? "",);

    file.value = fileCropped!;
  }


  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }
}
