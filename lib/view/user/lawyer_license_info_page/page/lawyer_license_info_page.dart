// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../../map_page.dart';
import '../../../../preview_map_page.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../controller/lawyer_license_info_controller.dart';

class LawyerLicenseInfoPage extends StatelessWidget {
  LawyerLicenseInfoPage({Key? key}) : super(key: key);
  /// Variables ///
  bool isFirstLunch = true;
  final theme = Get.theme;
  /// Instances ///
  final LawyerLicenseInfoController controller =
  Get.put(LawyerLicenseInfoController());

  /// Futures ///
  Future<bool> onBackClicked() {
    Get.back();
    controller.lat = double.parse(pref.lawyer.profile!.lat);
    controller.long = double.parse(pref.lawyer.profile!.long);
    return Future.value(false);
  }


  @override
  Widget build(BuildContext context) {
    debugPrint('${pref.lawyer.profile!.long} asasas');
    debugPrint('${controller.long} asasas');
    debugPrint('${pref.lawyer.profile!.lat} qqq');
    debugPrint('${controller.lat} qqq');
    var profile = controller.pref.lawyer.profile;
    if (isFirstLunch) {
      controller.licenceNumberTxtController.text =
          '${profile?.licenseNumber}';
      controller.createDateLicenceTxtController.text =
          '${profile?.licenseCreateDate} ';
      controller.expirationDateTxtController.text =
          '${profile?.licenseExpireDate} ';
      controller.cityTxtController.text = '${profile?.cityName} ';
      controller.officeAddressTxtController.text =
          '${profile?.addressOffice} ';
      controller.officeTelephoneTxtController.text =
          '${profile?.TellOffice}';
      isFirstLunch = false;
      controller.update();
    }
    return WillPopScope(
      onWillPop: onBackClicked,
      child: customScaffold(
          bottomAppBar: BottomAppBar(
              elevation: 0,
              child: Container(
                margin: EdgeInsets.all(standardSize),
                child: SizedBox(
                  width: fullWidth,
                  child:Obx(()=> progressButton(

                      onTap: controller.isBusyProfile.isFalse ?() {
                        controller.editAddressProfile();
                      }:null,
                      isProgress: controller.isBusyProfile.value,
                      text: "?????? ??????????????"),
                ),
              ))),
          appBar: AppBar(
            title: const Text(
              "???????????????? ???????????? ??????????",
            ),
            leading: backIcon(
              onTap: () {
                Get.back();
                controller.lat = double.parse(pref.lawyer.profile!.lat);
                controller.long = double.parse(pref.lawyer.profile!.long);
              },
            ),
          ),
          body:
              // controller.obx((_) {
              //             return
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(
                          start: standardSize,
                          end: standardSize,
                          top: standardSize,
                        ),
                        child: TextFormFieldWidget(
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.ltr,
                          label: "?????????? ???????????? ??????????",
                          // onChange: controller.valueChanged,
                          hint: "78654230",
                          textEditingController:
                              controller.licenceNumberTxtController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(
                          start: standardSize,
                          end: standardSize,
                          top: standardSize,
                        ),
                        child: TextFormFieldWidget(
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          readOnly: true,
                          onTap: () =>
                              controller.showDatePickerReceivedDate(context),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.rtl,
                          label: "?????????? ?????? ???????????? ??????????",
                          // onChange: controller.valueChanged,
                          hint:
                              "${Jalali.now().formatter.yyyy}/${Jalali.now().formatter.mm}/${Jalali.now().formatter.dd}",
                          textEditingController:
                              controller.createDateLicenceTxtController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(
                          start: standardSize,
                          end: standardSize,
                          top: standardSize,
                        ),
                        child: TextFormFieldWidget(
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          readOnly: true,
                          onTap: () =>
                              controller.showDatePickerExpirationDate(context),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.rtl,
                          label: "?????????? ???????????? ???????????? ??????????",
                          // onChange: controller.valueChanged,
                          hint:
                              "${Jalali.now().formatter.yyyy}/${Jalali.now().formatter.mm}/${Jalali.now().formatter.dd}",
                          textEditingController:
                              controller.expirationDateTxtController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(
                          start: standardSize,
                          end: standardSize,
                          top: standardSize,
                        ),
                        child: TextFormFieldWidget(
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.rtl,
                          label: "?????? ?????? ????????????",
                          // onChange: controller.valueChanged,
                          hint: "??????",
                          textEditingController: controller.cityTxtController,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                start: standardSize, top: xxSmallSize),
                            // alignment: Alignment.c,
                            child: Text(
                              '???????????? ?????????? ????????',
                              style: theme.textTheme.subtitle1!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          controller.pref.lawyer.profile?.lat != null
                              ? Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(smallRadius),
                                  ),
                                  child: Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: smallSize,
                                        start: largeSize,
                                        end: largeSize),
                                    width: fullWidth,
                                    height: fullHeight / 4,
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: SizedBox(
                                            width: fullWidth,
                                            height: fullHeight / 4,
                                            child: PreViewMapPage(
                                              lat: controller.lat!,
                                              long: controller.long!,
                                              // mapController: controller.mapController,
                                              // pickerMapController: controller.pickerController,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.off(MapPage());}
                                          ,
                                          child: Container(
                                            width: fullWidth,
                                            height: fullHeight / 4,
                                            color: Colors.transparent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () => Get.off(MapPage()),
                                  child: Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: smallSize,
                                        start: largeSize,
                                        end: largeSize),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(smallRadius),
                                        color:
                                            theme.primaryColor.withOpacity(0.2)),
                                    width: fullWidth,
                                    height: fullHeight / 4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.location_on),
                                        Center(
                                            child: Text(
                                          '?????????? ???????? ????????',
                                          style: theme.textTheme.subtitle1,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
/*
                      Container(
                        margin: EdgeInsetsDirectional.only(
                          start: standardSize,
                          end: standardSize,
                          top: standardSize,
                          bottom: standardSize,
                        ),
                        child: TextFormFieldWidget(
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textDirection: TextDirection.rtl,
                          label: "???????? ???????? ??????????",
                          // onChange: controller.valueChanged,
                          hint: "????????",
                          textEditingController:
                              controller.officeAddressTxtController,
                        ),
                      ),
*/
                      Container(
                        margin: EdgeInsetsDirectional.only(
                          start: standardSize,
                          end: standardSize,
                          top: standardSize,
                          bottom: standardSize,
                        ),
                        child: TextFormFieldWidget(
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textDirection: TextDirection.ltr,
                          label: "???????? ???????? ???????? ??????????",
                          // onChange: controller.valueChanged,
                          hint: "0512345678",
                          textEditingController:
                              controller.officeTelephoneTxtController,
                        ),
                      ),
                    ],
                  )),
          context: context),
    );
  }
}
