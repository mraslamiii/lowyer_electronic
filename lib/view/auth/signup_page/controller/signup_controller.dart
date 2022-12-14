import 'dart:io';
import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kanoon_dadgostari/app/app_exeption.dart';
import 'package:kanoon_dadgostari/models/base/title_value_model.dart';
import 'package:kanoon_dadgostari/models/sec/user_model.dart';
import 'package:kanoon_dadgostari/repo/sec/auth_repo.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/service/connection_service/connection_status.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/web_models/auth/auth_web_model.dart';
import 'package:lottie/lottie.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../app/app_pages.dart';
import '../../../../models/sec/upload_image_rqm.dart';
import '../../../../utilites/app_logger.dart';
import '../../../widgets/custom_snackbar/custom_snackbar.dart';

class SignUPController extends GetxController {


  /// Variables ///



  /// page 1
  TextEditingController idCodeUserController = TextEditingController();
  TextEditingController phoneTxtController = TextEditingController();
  TextEditingController nameTxtController = TextEditingController();
  TextEditingController lastNameTxtController = TextEditingController();
  RxString nameTxt = ''.obs;
  RxString lastNameTxt = ''.obs;
  RxString idCodeUserTxt = ''.obs;
  String? phone = "";
  String? imagePath = "";
  /// page 2
  TextEditingController lawyerLicenseNumTxtController = TextEditingController();
  TextEditingController lawyerLicenseRecDateTxtController = TextEditingController();
  TextEditingController lawyerLicenseExpDateTxtController = TextEditingController();
  RxString lawyerLicenseNumTxt = ''.obs;
  RxString lawyerLicenseRecDateTxt = ''.obs;
  RxString lawyerLicenseExpDateTxt = ''.obs;

  final LocalStorageService pref = Get.find<LocalStorageService>();
  final ConnectionStatusController connectionStatusController =
      Get.find<ConnectionStatusController>();
  AuthRepository repo = AuthRepository();
  Rx<File> file = File('').obs;
  Rx<Jalali>? receivedDate = Jalali
      .now()
      .obs;
  Rx<Jalali>? expirationDate = Jalali
      .now()
      .obs;
  RxBool isBusyLogin = false.obs;
  // Future upLoadAvatarToServer() async {
  //   var rqm = UploadImageRQM(avatar: imagePath,method: 'patch');
  //   try {
  //     var a  = await repo.uploadImage(rqm);
  //     update();
  //     // Get.back();
  //     return a;
  //   } catch (e) {
  //     AppLogger.e('$e');
  //   }
  // }

  Future upLoadAvatarToUploader(File file) async {
    try {
      imagePath = await repo.uploadFile(file);
      // upLoadAvatarToServer();
      update();
      return imagePath;
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
      print(e);
    }

    // _file?.value = file;
  }

  Future<void> fetchData(
      String phone
      ) async {
    if (isBusyLogin.isFalse &&
        connectionStatusController.connectionStatus ==
            ConnectionStatus.connect) {
      try {
        isBusyLogin.value = true;

        var result = await repo.registerRequest(RegisterRQM(
            firstName: nameTxt.value,
            lastName: lastNameTxt.value,
            mobileNumber: phone,
            nationalCode: idCodeUserTxt.value,
            avatar: imagePath ?? file.value.path,
            licenseNumber: lawyerLicenseNumTxt.value,
            licenseCreateDate: lawyerLicenseRecDateTxt.value,
            licenseExpireDate: lawyerLicenseExpDateTxt.value,
        ));
        isBusyLogin.value = false;

        pref.setUser(result.user!.toJson());

        Get.offAllNamed(Routes.verifyDetails);
      } on TitleValueException catch (exp) {
        for (TitleValueModel error in exp.errors) {
          isBusyLogin.value = false;
          exeptionSnackBar(error.value![0]);
        }
      } catch (e) {
        isBusyLogin.value = false;

        rethrow;
      }
    } else {
      isBusyLogin.value = false;
    }
  }


  void showDatePickerReceivedDate(BuildContext context) async {
    Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1320, 8),
      lastDate: Jalali(1450, 9),
      textDirection: TextDirection.rtl,
      initialDatePickerMode: PDatePickerMode.day,
    );
    if (picked != null) {
      receivedDate!.value = picked;
      lawyerLicenseRecDateTxtController.text =
      "${receivedDate?.value.formatter.yyyy}/${receivedDate?.value.formatter
          .mm}/${receivedDate?.value.formatter.dd}";
      lawyerLicenseRecDateTxt.value = lawyerLicenseRecDateTxtController.text;
    }
  }

  void showDatePickerExpirationDate(BuildContext context) async {
    Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali.now(),
      lastDate: Jalali(DateTime
          .now()
          .year + 20, 12, 29),
      textDirection: TextDirection.rtl,
      initialDatePickerMode: PDatePickerMode.day,
    );
    if (picked != null) {
      expirationDate!.value = picked;
      lawyerLicenseExpDateTxtController.text =
      "${expirationDate?.value.formatter.yyyy}/${expirationDate?.value.formatter
          .mm}/${expirationDate?.value.formatter.dd}";
      lawyerLicenseExpDateTxt.value = lawyerLicenseExpDateTxtController.text;
    }
  }
}
