import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../binding/lawyer_license_info_binding.dart';
import '../controller/lawyer_license_info_controller.dart';

class LawyerLicenseInfoPage extends GetView<LawyerLicenseInfoController> {
  const LawyerLicenseInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LawyerLicenseInfoController>(
        init: controller,
        // initState: (state) {
        //   controller.fetchData();
        //   print();
        // },
        builder: (_) {
          return customScaffold(
            bottomAppBar: BottomAppBar(
                elevation: 0,
                child: Container(
                  margin: EdgeInsets.all(standardSize),
                  child: SizedBox(
                    width: fullWidth,
                    child: progressButton(onTap: () {}, text: "ثبت اطلاعات"),
                  ),
                )),
            appBar: AppBar(
              title: const Text(
                "اطلاعـات پروانه وکالت",
              ),
              leading: backIcon(),
            ),
            body:
    controller.obx((_) {
                return
                  SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child:
                      Column(children:[
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
                        label: "شماره پروانه وکالت",
                        // onChange: controller.valueChanged,
                        hint: "78654230",
                        textEditingController: controller.lawyerNumberTxtController,
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
                        onTap: () => controller.showDatePickerReceivedDate(context),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textDirection: TextDirection.rtl,
                        label: "تاریخ اخذ پروانه وکالت",
                        // onChange: controller.valueChanged,
                        hint: "${Jalali.now().formatter.yyyy}/${Jalali.now().formatter.mm}/${Jalali.now().formatter.dd}",
                        textEditingController: controller.dateReceivedTxtController,
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
                        onTap: () => controller.showDatePickerExpirationDate(context),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textDirection: TextDirection.rtl,
                        label: "تاریخ انقضاء پروانه وکالت",
                        // onChange: controller.valueChanged,
                        hint: "${Jalali.now().formatter.yyyy}/${Jalali.now().formatter.mm}/${Jalali.now().formatter.dd}",
                        textEditingController: controller.expirationDateTxtController,
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
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        textDirection: TextDirection.rtl,
                        label: "شهر محل فعالیت",
                        // onChange: controller.valueChanged,
                        hint: "شهر",
                        textEditingController: controller.cityTxtController,
                      ),
                    ),
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
                        label: "آدرس دفتر وکالت",
                        // onChange: controller.valueChanged,
                        hint: "آدرس",
                        textEditingController:
                            controller.officeAddressTxtController,
                      ),
                    ),
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
                        label: "تلفن ثابت دفتر وکالت",
                        // onChange: controller.valueChanged,
                        hint: "0512345678",
                        textEditingController:
                            controller.officeTelephoneTxtController,
                      ),
                    ),
                  ],
                      ));
              },
        onEmpty: Container(),
        onError: (error) => Text('خطا در ارتباط با سرور',style: Get.theme.textTheme.subtitle1),
        onLoading: const Center(child: CupertinoActivityIndicator())
            ),
            context: context,
          );
        });
  }
}
