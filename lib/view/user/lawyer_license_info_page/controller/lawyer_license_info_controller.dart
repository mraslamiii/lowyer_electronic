import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../app/app_exeption.dart';
import '../../../../models/base/title_value_model.dart';
import '../../../../models/sec/lawyer_profile_model.dart';
import '../../../../repo/sec/lawyer_repo.dart';
import '../../../../service/connection_service/connection_status.dart';
import '../../../widgets/custom_snackbar/custom_snackbar.dart';

class LawyerLicenseInfoController extends GetxController with StateMixin<LawyerProfileModel> {
  final LocalStorageService pref = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
  }
  RxBool isBusyProfile = false.obs;
  LawyerProfileModel? result;

  LawyersRepository repo = LawyersRepository();
  final ConnectionStatusController connectionStatusController =
  Get.put(ConnectionStatusController());

  Rx<Jalali>? receivedDate = Jalali.now().obs;
  Rx<Jalali>? expirationDate = Jalali.now().obs;

  TextEditingController lawyerNumberTxtController = TextEditingController();
  TextEditingController dateReceivedTxtController = TextEditingController();
  TextEditingController expirationDateTxtController = TextEditingController();
  TextEditingController cityTxtController = TextEditingController();
  TextEditingController officeAddressTxtController = TextEditingController();
  TextEditingController officeTelephoneTxtController = TextEditingController();

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
      dateReceivedTxtController.text =
          "${receivedDate?.value.formatter.yyyy}/${receivedDate?.value.formatter.mm}/${receivedDate?.value.formatter.dd}";
    }
  }

  void showDatePickerExpirationDate(BuildContext context) async {
    Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali.now(),
      lastDate: Jalali(DateTime.now().year + 20, 12, 29),
      textDirection: TextDirection.rtl,
      initialDatePickerMode: PDatePickerMode.day,
    );
    if (picked != null) {
      expirationDate!.value = picked;
      expirationDateTxtController.text =
          "${expirationDate?.value.formatter.yyyy}/${expirationDate?.value.formatter.mm}/${expirationDate?.value.formatter.dd}";
    }
  }

  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }

  // Future<void> fetchData() async {
  //   if (!isBusyProfile.value) {
  //     try {
  //       isBusyProfile.value = true;
  //       change(null, status: RxStatus.loading());
  //       result = await repo.getLawyer('1');
  //       change(result, status: RxStatus.success());
  //       isBusyProfile.value = false;
  //       nameTxtController.text = '${result?.user?.firstName?.trim() ?? ' '} ';
  //       lastNameTxtController.text = '${result?.user?.lastName?.trim() ?? ' '} ';
  //       fatherNameTxtController.text = '${result?.user?.fatherName?.trim() ?? ''} ';
  //       nationalCodeTxtController.text =
  //           result?.user?.national_code?.trim() ?? '';
  //       addressTxtController.text = '${result?.user?.address?.trim() ?? ''} ';
  //       zipCodeTxtController.text = result?.user?.zipCode?.trim() ?? '';
  //
  //       // Get.offAllNamed(Routes.homePage);
  //     } on TitleValueException catch (exp) {
  //       for (TitleValueModel error in exp.errors) {
  //         isBusyProfile.value = false;
  //         exeptionSnackBar(error.value![0]);
  //       }
  //     } catch (e) {
  //       isBusyProfile.value = false;
  //       change(null, status: RxStatus.error('e'));
  //
  //       rethrow;
  //     }
  //   } else {
  //     change(null, status: RxStatus.error('e'));
  //     isBusyProfile.value = false;
  //   }
  // }
}
