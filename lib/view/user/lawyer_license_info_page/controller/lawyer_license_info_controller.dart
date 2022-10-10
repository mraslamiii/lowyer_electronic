import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/enums/snackbar_type.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/enums/result_enum.dart';
import 'package:kanoon_dadgostari/utilites/show_result.dart';
import 'package:kanoon_dadgostari/view/base/home_page/page/home_page.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../models/lawyer/lawyer_rqm/edit_address_rqm.dart';
import '../../../../models/lawyer/info_profile_model.dart';
import '../../../../repo/lawyer/lawyer_repo.dart';
import '../../../../service/connection_service/connection_status.dart';
import '../../../../utilites/app_logger.dart';

class LawyerLicenseInfoController extends GetxController
    with StateMixin<InfoProfileModel> {
  final LocalStorageService pref = Get.find<LocalStorageService>();
   GeoPoint? geoPoint; //todo //get from server f
  late MapController mapController;
  late PickerMapController pickerController;
  double? lat;

  double? long;

  @override
  void onInit() async {
    lat = double.parse(pref.lawyer.profile?.lat?? '');
    debugPrint('${lat} asda');
    long = double.parse(pref.lawyer.profile?.long?? '');
    pickerController = PickerMapController();
    mapController =
        MapController(initPosition: geoPoint, initMapWithUserPosition: false);
    super.onInit();
  }

  @override
  void onClose() {
    licenceNumberTxtController.dispose();
    createDateLicenceTxtController.dispose();
    expirationDateTxtController.dispose();
    cityTxtController.dispose();
    officeAddressTxtController.dispose();
    officeTelephoneTxtController.dispose();
    super.onClose();
  }

  RxBool isBusyProfile = false.obs;

  LawyersRepository repo = LawyersRepository();
  final ConnectionStatusController connectionStatusController =
      Get.put(ConnectionStatusController());

  Rx<Jalali>? receivedDate = Jalali.now().obs;
  Rx<Jalali>? expirationDate = Jalali.now().obs;

  TextEditingController licenceNumberTxtController = TextEditingController();
  TextEditingController createDateLicenceTxtController =
      TextEditingController();
  TextEditingController expirationDateTxtController = TextEditingController();
  TextEditingController cityTxtController = TextEditingController();
  TextEditingController officeAddressTxtController = TextEditingController();
  TextEditingController officeTelephoneTxtController = TextEditingController();

  Future<void> changeLoctaion(GeoPoint geoPoint) async {
    await mapController.changeLocationMarker(
        oldLocation: geoPoint, newLocation: geoPoint);
    await mapController.changeLocation(geoPoint); //todo// dosen't update in ui
    update();
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
      createDateLicenceTxtController.text =
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

  Future editAddressProfile() async {
    try {
      if (isBusyProfile.value == false) {
        isBusyProfile.value = true;
        update();
        bool result = await repo.editAddress(EditAddressRQM(
          cityName: cityTxtController.text,
          addressOffice: officeAddressTxtController.text,
          tellOffice: officeTelephoneTxtController.text,
          lat: '$lat',
          long: '$long',
          method: 'patch',
          licenseNumber: licenceNumberTxtController.text,
          licenseCreateDate: createDateLicenceTxtController.text,
          licenseExpiredDate: expirationDateTxtController.text,
        ));
        isBusyProfile.value = false;
        update();
        if (result) {
          Get.offAll(HomePage());
          // Get.back(result: 'result');
          showTheResult(
              resultType: SnackbarType.success,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'موفقیت',
              message: 'تغییرات با موفقیت اعمال شد');
        } else {
          showTheResult(
              resultType: SnackbarType.error,
              showTheResultType: ShowTheResultType.snackBar,
              title: 'Error',
              message: 'Something wrong');
          //todo fix error
        }
      }
    } catch (e) {
      isBusyProfile.value = false;
      update();
      showTheResult(
          resultType: SnackbarType.error,
          showTheResultType: ShowTheResultType.snackBar,
          title: 'Error',
          message: '$e');
      AppLogger.e('$e');
    }
  }

/*
  Future<void> fetchData() async {
    if (!isBusyProfile.value) {
      try {
        isBusyProfile.value = true;
        change(null, status: RxStatus.loading());
        result = await repo.getLawyer('${pref.user.lawyerProfile}');
        change(result, status: RxStatus.success());
        isBusyProfile.value = false;
        lawyerNumberTxtController.text = '${result?.data.profile.licenseNumber.trim() ?? ' '} ';
        dateReceivedTxtController.text = '${result?.data.profile.licenseCreateDate.trim() ?? ' '} ';
        expirationDateTxtController.text = '${result?.data.profile.licenseExpireDate.trim() ?? ''} ';
        cityTxtController.text =
            result?.data.profile.cityName.trim() ?? '';
        officeAddressTxtController.text = '${result?.data.profile.addressOffice.trim() ?? ''} ';
        officeTelephoneTxtController.text = result?.data.profile.TellOffice.trim() ?? '';

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
*/
}
