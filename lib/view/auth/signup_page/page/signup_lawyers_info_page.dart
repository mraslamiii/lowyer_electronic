import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/auth/signup_page/controller/signup_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/back_widget/back_widget.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../widgets/avatar_image_circle.dart';
import '../../../widgets/customScaffold/customScaffold.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';

class SignUpLawyerInfoPage extends StatelessWidget {

  SignUpLawyerInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUPController>(
      builder: (controller) {
        return customScaffold(
          context: context,
          appBar: AppBar(
            leading: backIcon(),
            title: const Text(
              "ورود اپلیکیشن",
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
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
                  onChange: (value) => controller.lawyerLicenseNumTxt.value = value,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  textDirection: TextDirection.rtl,
                  label: "شماره پروانه وکالت",
                  // onChange: controller.valueChanged,
                  hint: "78654230",
                  textEditingController: controller.lawyerLicenseNumTxtController,
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
                  textEditingController: controller.lawyerLicenseRecDateTxtController,
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
                  textEditingController: controller.lawyerLicenseExpDateTxtController,
                ),
              ),
            ],
          ),
          bottomAppBar: Padding(
            padding: EdgeInsets.all(standardSize),
            child: SizedBox(
              width: fullWidth,
              child: Obx(
                () => progressButton(
                  isProgress: controller.isBusyLogin.value,
                  onTap: controller.lawyerLicenseNumTxt.value.isNotEmpty &&
                          controller
                              .lawyerLicenseRecDateTxt.value.isNotEmpty &&
                          controller
                              .lawyerLicenseExpDateTxt.value.isNotEmpty &&
                      controller
                          .isBusyLogin.isFalse
                      ? () {
                          controller.fetchData(controller.phone!);
                        }
                      : null,
                  text: "تایید",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
