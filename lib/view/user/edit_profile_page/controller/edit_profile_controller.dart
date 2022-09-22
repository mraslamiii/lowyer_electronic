import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/utilites/app_logger.dart';
import 'package:kanoon_dadgostari/utilites/show_result.dart';
import '../../../../enums/snackbar_type.dart';
import '../../../../models/lawyer/lawyer_rqm/edit_education_rqm.dart';
import '../../../../models/lawyer/info_profile_model.dart';
import '../../../../repo/lawyer/lawyer_repo.dart';
import '../../../../service/connection_service/connection_status.dart';
import '../../../../enums/result_enum.dart';
import '../../../widgets/custom_snackbar/custom_snackbar.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';

class EditProfileController extends GetxController {
  late LawyerData lawyer;

  RxBool isBusyProfile = false.obs;
  RxBool isBusyGetEd = false.obs;

  int educationSelected = -1;

  List<String> educations = [
    "دیپلم",
    "فوق دیپلم",
    "لیسانس",
    "فوق لیسانس",
    "دکتری",
    "فوق دکتری",
  ];

//********************************************************************************************************************************************
  final LocalStorageService pref = Get.find<LocalStorageService>();

  LawyersRepository repo = LawyersRepository();
  final ConnectionStatusController connectionStatusController =
  Get.put(ConnectionStatusController());

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
  double keyBoardHeight =0.0;
//********************************************************************************************************************************************
  @override
  void onInit() {
    super.onInit();
    // KeyboardVisibilityNotification().addNewListener(onChange: (visible) {
    //   if (visible) {
    //     Future.delayed(const Duration(milliseconds: 300),(){
    //       keyBoardHeight = MediaQuery.of(Get.context!).viewInsets.bottom;
    //     });
    //
    //   }else{
    //     keyBoardHeight=0;
    //   }
    // }

      // ,);
    lawyer = pref.lawyer;
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

  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }

  Future editProfileEducation() async {
    try {
      if (isBusyProfile.value == false) {
        isBusyProfile.value = true;
        update();
        bool result = await repo.editProfile(EditEducationRQM(
          firstName: nameTxtController.text,
          lastName: lastNameTxtController.text,
          fatherName: fatherNameTxtController.text,
          nationalCode: nationalCodeTxtController.text,
          address: addressTxtController.text,
          postalCode: zipCodeTxtController.text,
          academicDiscipline: eduMajorTxtController.text,
          education: educationSelected !=-1 ? educations[educationSelected] :'',
          educationPlace: eduLocationTxtController.text,
        ));
        isBusyProfile.value = false;
        update();
        if (result) {
          Get.back(result: 'result');
          showTheResult(resultType: SnackbarType.success,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'موفقیت',
              message: 'تغییرات با موفقیت اعمال شد');
        } else {
          //todo handle error
        }
      }
    } catch (e) {
      isBusyProfile.value = false;
      //todo handle error
      exeptionSnackBar('$e');
      update();
      AppLogger.e('$e');
    }
  }
}
