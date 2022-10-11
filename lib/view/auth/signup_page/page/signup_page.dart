import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/auth/signup_page/controller/signup_controller.dart';
import 'package:kanoon_dadgostari/view/auth/signup_page/page/signup_lawyers_info_page.dart';
import 'package:kanoon_dadgostari/view/widgets/back_widget/back_widget.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';
import 'package:kanoon_dadgostari/view/widgets/sign_up_upload_image_widget.dart';
import '../../../widgets/customScaffold/customScaffold.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';

class SignUpPage extends StatelessWidget {
  String? phone = "";

  SignUpPage({ this.phone,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUPController>(
      builder: (controller) {
        phone = Get.arguments as String;
        controller.phoneTxtController.text = phone ?? '';
        controller.phone = phone ?? '';
        return WillPopScope(
          onWillPop: backtoLogin,
          child: customScaffold(
            context: context,
            appBar: AppBar(
              leading: backIcon(
                onTap: () => backtoLogin(),
              ),
              title: const Text(
                "ورود اپلیکیشن",
              ),
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: largeSize),
                  child: uploadImageBoxWidget(
                      onTap: () {
                        controller.openGallery();
                      },
                      file: controller.file,
                      boxFit: BoxFit.fitWidth),
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
                    onChange: (value) => controller.nameTxt.value = value,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "این مقدار ضروری میباشد";
                      } else {
                        return null;
                      }
                    },
                    hint: "نام",
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
                    onChange: (value) => controller.lastNameTxt.value = value,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "این مقدار ضروری میباشد";
                      } else {
                        return null;
                      }
                    },
                    hint: "نام خانوادگی",
                    textEditingController: controller.lastNameTxtController,
                  ),
                ),
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
                      onChange: (value) => controller.idCodeUserTxt.value = value,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textDirection: TextDirection.rtl,
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
                      hint: "0923456789",
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
                    "شماره تلفن همراه",
                    style: Get.theme.textTheme.subtitle1,
                  ),
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
                      readOnly: true,
                      onChange: (value) => phone = value,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textDirection: TextDirection.rtl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // hint: "09012345678",
                      keyboardType: TextInputType.number,
                      textEditingController: controller.phoneTxtController,
                    ),
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
                    onTap: controller.nameTxt.value.isNotEmpty &&
                            controller
                                .lastNameTxt.value.isNotEmpty &&
                            (phone?.isNotEmpty ?? false) &&
                            controller
                                .idCodeUserTxt.value.isNotEmpty
                        ? () {
                            // controller.fetchData();
                            Get.to(SignUpLawyerInfoPage());
                          }
                        : null,
                    text: "مرحله بعد",
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
