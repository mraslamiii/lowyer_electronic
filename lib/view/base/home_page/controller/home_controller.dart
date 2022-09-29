import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kanoon_dadgostari/enums/result_enum.dart';
import 'package:kanoon_dadgostari/enums/snackbar_type.dart';
import 'package:kanoon_dadgostari/utilites/show_result.dart';
import '../../../../models/base/upload_model.dart';
import '../../../../repo/sec/auth_repo.dart';
import '../../../../service/preferences_service.dart';
import '../../../../utilites/app_logger.dart';
import '../../../auth/login_page/page/login_page.dart';

class HomeController extends GetxController {
  Rx<File> file = File('').obs;

  final AuthRepository repo = AuthRepository();
  final LocalStorageService pref = Get.find();
  UploadModel? response;

  Future<void> openCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    file.value = File(pickedFile?.path ?? "");
    final fileCropped = await ImageCropper().cropImage(
      sourcePath: pickedFile?.path ?? "",
    );
    file.value = fileCropped!;
    upLoadAvatar(file.value);

  }

  Future<void> openGallery() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      file.value = File(pickedFile?.path ?? "");

      final fileCropped = await ImageCropper().cropImage(
        sourcePath: pickedFile?.path ?? "",
      );

      file.value = fileCropped!;
      upLoadAvatar(file.value);
    } catch (e) {
      AppLogger.e('$e');
    }

    // _file?.value = file;
  }

  String? res;

  Future upLoadAvatar(File file) async {
    try {
      res = await repo.uploadFile(file);
      update();
      return res;
    } catch (e) {
      AppLogger.e('$e');
    }
  }

  Future fetchHomeData() async {
    try {
      bool result = await repo.fetchUser();
      update();
      return result;
    } catch (e) {
      showTheResult(
          resultType: SnackbarType.error,
          showTheResultType: ShowTheResultType.snackBar,
          title: 'خطا',
          message: '$e');
      AppLogger.e('$e');
    }
  }

  Future logOut() async {
    try {
      var result = await repo.logoutRepo();
      if (result != null) {
        pref.logOut();
        update();
        Get.offAll(LoginPage());
        showTheResult(
            resultType: SnackbarType.success,
            showTheResultType: ShowTheResultType.snackBar,
            title: 'موفق',
            message: 'شما با موفقیت خارج شدید');
        return result;
      } else {
        Get.offAll(LoginPage());

        showTheResult(
            resultType: SnackbarType.error,
            showTheResultType: ShowTheResultType.snackBar,
            title: 'خطا',
            message: result.data);
      }
    } catch (e) {
      Get.offAll(LoginPage());

      showTheResult(
          resultType: SnackbarType.error,
          showTheResultType: ShowTheResultType.snackBar,
          title: 'خطا',
          message: '$e');
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
