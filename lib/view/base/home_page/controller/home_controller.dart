import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kanoon_dadgostari/enums/result_enum.dart';
import 'package:kanoon_dadgostari/enums/snackbar_type.dart';
import 'package:kanoon_dadgostari/models/sec/upload_image_rqm.dart';
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
  RxBool isBusyLogout = false.obs;

  Future<void> openCamera() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      file.value = File(pickedFile?.path ?? "");
      final fileCropped = await ImageCropper().cropImage(
        sourcePath: pickedFile?.path ?? "",
      );
      file.value = fileCropped!;
      // upLoadAvatar(file.value);
      upLoadAvatarToUploader(file.value);
    } catch (e) {
      AppLogger.e('$e');
    }
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
      upLoadAvatarToUploader(file.value);
    } catch (e) {
      AppLogger.e('$e');
    }

    // _file?.value = file;
  }
  String? res;
  Future upLoadAvatarToServer() async {
    var rqm = UploadImageRQM(avatar: res,method: 'patch');
    try {
      var a  = await repo.uploadImage(rqm);
      update();
      // Get.back();
      return a;
    } catch (e) {
      AppLogger.e('$e');
    }
  }
  Future upLoadAvatarToUploader(File file) async {
    try {
      res = await repo.uploadFile(file);
      upLoadAvatarToServer();
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
      if (isBusyLogout.value == false) {
        isBusyLogout.value = true;
        update();
        var result = await repo.logoutRepo();
        if (result != null) {
          isBusyLogout.value =false;
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
          isBusyLogout.value =false;
          update();
          Get.offAll(LoginPage());
          showTheResult(
              resultType: SnackbarType.error,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'خطا',
              message: result.data);
        }
      }
    } catch (e) {
      isBusyLogout.value =false;
      update();
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
