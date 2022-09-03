import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/auth/signup_page/controller/signup_controller.dart';

import '../../../widgets/customScaffold/customScaffold.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUPController>(
      builder: (controller) => WillPopScope(
        onWillPop: controller.back,
        child: customScaffold(
            context: context,
            appBar: AppBar(
                title: const Text(
                  "ثبت نام",
                ),
                automaticallyImplyLeading: false),
            body: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Padding(
                  padding: EdgeInsets.all(largeSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("کد ملی", style: Get.theme.textTheme.subtitle1),
                      Padding(
                        padding: EdgeInsets.only(top: standardSize),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Obx(
                            () => TextFormFieldWidget(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textDirection: TextDirection.ltr,

                              maxLength: 10,
                              //
                              onChange: controller.valueChanged,

                              errorText: controller.errorCodeNumber.value,
                              hint: "915xxxxxx",
                              textEditingController:
                                  controller.idCodeUserController,
                            ),
                          ),
                        ),
                      ),
                      Text("تاریخ تولد", style: Get.theme.textTheme.subtitle1),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: standardSize),
                        child: TextFormFieldWidget(
                            readOnly: true,
                            textDirection: TextDirection.rtl,
                            onTap: () {
                              controller.showDatePicker(context);
                            },
                            hint: "انتخاب تاریخ تولد",
                            maxLine: 1,
                            textEditingController:
                                controller.dateTimeTxtController),
                      ),
                      Text("شماره تلفن همراه",
                          style: Get.theme.textTheme.subtitle1),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: standardSize),
                        child: TextFormFieldWidget(
                            readOnly: true,
                            textDirection: TextDirection.rtl,
                            hint: "انتخاب تاریخ تولد",
                            maxLine: 1,
                            textEditingController: controller.phoneTxtController),
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.only(bottom: xxLargeSize * 2),
                        child: SizedBox(
                          width: fullWidth,
                          child: Obx(
                            () => ElevatedButton(
                                onPressed:
                                    controller.idCodeNumber.value.isNotEmpty &&
                                            controller.dateTimeTxtController.text
                                                .isNotEmpty
                                        ? () {
                                            controller.submitFunc();
                                          }
                                        : null,
                                child: const Text("ارسال کد تایید")),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
