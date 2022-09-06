import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as dateFormat;
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class LawyerLicenseInfoController extends GetxController {
  final LocalStorageService pref = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
  }

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
}
