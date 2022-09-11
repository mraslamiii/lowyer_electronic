import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/auth/signup_page/controller/signup_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/back_widget/back_widget.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';

import '../../../widgets/customScaffold/customScaffold.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';

class SignUpPage extends StatelessWidget {
  String? phone = "";

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUPController>(
      builder: (controller) {
        phone = Get.arguments as String;
        controller.phoneTxtController.text = phone!;
        return WillPopScope(
          onWillPop: backtoLogin,
          child: customScaffold(
            context: context,
            appBar: AppBar(
              leading: backIcon(
                onTap: () => backtoLogin(),
              ),
              title: const Text(
                "ثبت نام",
              ),
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: standardSize,
                    horizontal: standardSize,
                  ),
                  child: Text("کد ملی", style: Get.theme.textTheme.subtitle1),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: standardSize,
                    left: standardSize,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextFormFieldWidget(
                      onEditingComplete: () {
                        controller.update();
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textDirection: TextDirection.ltr,
                      maxLength: 10,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length < 10) {
                          return "کد ملی حداقل باید 10 رقم باشد";
                        } else if (value.isEmpty) {
                          return "این مقدار ضروری میباشد";
                        } else {
                          return null;
                        }
                      },
                      hint: "915xxxxxx",
                      keyboardType: TextInputType.number,
                      textEditingController: controller.idCodeUserController,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: standardSize,
                    horizontal: standardSize,
                  ),
                  child: Text(
                    "نام",
                    style: Get.theme.textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: standardSize,
                    left: standardSize,
                  ),
                  child: TextFormFieldWidget(
                    onEditingComplete: () {
                      controller.update();
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "این مقدار ضروری میباشد";
                      } else {
                        return null;
                      }
                    },
                    hint: "نام خود را وارد کنید",
                    textEditingController: controller.nameTxtController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: standardSize,
                    horizontal: standardSize,
                  ),
                  child: Text(
                    "نام خانوادگی",
                    style: Get.theme.textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: standardSize,
                    left: standardSize,
                  ),
                  child: TextFormFieldWidget(
                    onEditingComplete: () {
                      controller.update();
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "این مقدار ضروری میباشد";
                      } else {
                        return null;
                      }
                    },
                    hint: "نام خانوادگی خود را وارد کنید",
                    textEditingController: controller.lastNameTxtController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: standardSize,
                    horizontal: standardSize,
                  ),
                  child: Text(
                    "شماره تلفن همراه",
                    style: Get.theme.textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: standardSize,
                    left: standardSize,
                  ),
                  child: TextFormFieldWidget(
                    textDirection: TextDirection.rtl,
                    hint: "0903xxxxxxx",
                    maxLine: 1,
                    onEditingComplete: () {
                      controller.update();
                    },
                    keyboardType: TextInputType.number,
                    textEditingController: controller.phoneTxtController,
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
                    onTap: controller.nameTxtController.value.text.isNotEmpty &&
                            controller
                                .lastNameTxtController.value.text.isNotEmpty &&
                            controller
                                .phoneTxtController.value.text.isNotEmpty &&
                            controller
                                .idCodeUserController.value.text.isNotEmpty
                        ? () {
                            controller.fetchData(phone!);
                          }
                        : null,
                    text: "ادامه ثبت نام",
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
