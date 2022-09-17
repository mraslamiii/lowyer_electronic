import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/utilites/app_logger.dart';
import '../../../../app/app_exeption.dart';
import '../../../../models/base/title_value_model.dart';
import '../../../../models/sec/edit_education_rqm.dart';
import '../../../../models/sec/info_profile_model.dart';
import '../../../../repo/sec/lawyer_repo.dart';
import '../../../../service/connection_service/connection_status.dart';
import '../../../widgets/custom_snackbar/custom_snackbar.dart';

class EditProfileController extends GetxController {
  final LocalStorageService pref = Get.find<LocalStorageService>();

  RxBool isBusyProfile = false.obs;
  RxBool isBusyGetEd = false.obs;

  // bool isFirstLunch = true;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    nameTxtController.dispose();
    lastNameTxtController.dispose();
    fatherNameTxtController.dispose();
    nationalCodeTxtController.dispose();
    eduMajorTxtController.dispose();
    educationTxtController.dispose();
    eduLocationTxtController.dispose();
    addressTxtController.dispose();
    zipCodeTxtController.dispose();
    super.onClose();
  }

  TextEditingController nameTxtController = TextEditingController();
  TextEditingController lastNameTxtController = TextEditingController();
  TextEditingController fatherNameTxtController = TextEditingController();
  TextEditingController nationalCodeTxtController = TextEditingController();
  TextEditingController eduMajorTxtController = TextEditingController();
  TextEditingController educationTxtController = TextEditingController();
  TextEditingController eduLocationTxtController = TextEditingController();

  // TextEditingController phoneTxtController = TextEditingController();
  TextEditingController addressTxtController = TextEditingController();
  TextEditingController zipCodeTxtController = TextEditingController();

  int educationSelected = -1;
  List<String> educations = [
    "دیپلم",
    "فوق دیپلم",
    "لیسانس",
    "فوق لیسانس",
    "دکتری",
    "فوق دکتری",
  ];

  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }

  InfoProfileModel? result;

  LawyersRepository repo = LawyersRepository();
  final ConnectionStatusController connectionStatusController =
      Get.put(ConnectionStatusController());

  Future editProfileEducation() async {
    try {
      if (isBusyProfile.value == false) {
        isBusyProfile.value = true;
        update();
        result = await repo.editProfile(EditEducationRQM(
          firstName: nameTxtController.text,
          lastName: lastNameTxtController.text,
          fatherName: fatherNameTxtController.text,
          nationalCode: nationalCodeTxtController.text,
          address: addressTxtController.text,
          postalCode: zipCodeTxtController.text,
          academicDiscipline: eduMajorTxtController.text,
          education: educations[educationSelected],
          educationPlace: eduLocationTxtController.text,
        ));
        isBusyProfile.value = false;
        update();
        Get.back(result: 'result');
      }
    } catch (e) {
      isBusyProfile.value = false;
      update();
      AppLogger.e('$e');
    }
  }

/*
  Future<void> fetchData() async {
    if (!isBusyGetEd.value) {
      try {
        isBusyGetEd.value = true;
        change(null, status: RxStatus.loading());
        result = await repo.getLawyer('${pref.user.lawyerProfile}');
        change(result, status: RxStatus.success());
        isBusyGetEd.value = false;
        update();
      } on TitleValueException catch (exp) {
        for (TitleValueModel error in exp.errors) {
          exeptionSnackBar(error.value![0]);
        }
      } catch (e) {
        change(null, status: RxStatus.error('e'));

        rethrow;
      }

  }
}
*/
}
