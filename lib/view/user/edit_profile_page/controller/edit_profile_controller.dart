import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import '../../../../app/app_exeption.dart';
import '../../../../models/base/title_value_model.dart';
import '../../../../models/sec/lawyer_profile_model.dart';
import '../../../../repo/sec/lawyer_repo.dart';
import '../../../../service/connection_service/connection_status.dart';
import '../../../widgets/custom_snackbar/custom_snackbar.dart';


class EditProfileController extends GetxController
    with StateMixin<LawyerProfileModel> {
  final LocalStorageService pref = Get.find<LocalStorageService>();

  RxBool isBusyProfile = false.obs;

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

  LawyerProfileModel? result;

  LawyersRepository repo = LawyersRepository();
  final ConnectionStatusController connectionStatusController =
      Get.put(ConnectionStatusController());

  Future<void> fetchData() async {
    if (!isBusyProfile.value) {
      try {
        isBusyProfile.value = true;
        change(null, status: RxStatus.loading());
        result = await repo.getLawyer('1');
        change(result, status: RxStatus.success());
        isBusyProfile.value = false;
        nameTxtController.text = '${result?.user?.firstName?.trim() ?? ' '} ';
        lastNameTxtController.text = '${result?.user?.lastName?.trim() ?? ' '} ';
        fatherNameTxtController.text = '${result?.user?.fatherName?.trim() ?? ''} ';
        nationalCodeTxtController.text =
            result?.user?.national_code?.trim() ?? '';
        addressTxtController.text = '${result?.user?.address?.trim() ?? ''} ';
        zipCodeTxtController.text = result?.user?.zipCode?.trim() ?? '';

        // Get.offAllNamed(Routes.homePage);
      } on TitleValueException catch (exp) {
        for (TitleValueModel error in exp.errors) {
          isBusyProfile.value = false;
          exeptionSnackBar(error.value![0]);
        }
      } catch (e) {
        isBusyProfile.value = false;
        change(null, status: RxStatus.error('e'));

        rethrow;
      }
    } else {
      change(null, status: RxStatus.error('e'));
      isBusyProfile.value = false;
    }
  }
}
