import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/auth/login_page/controller/login_controller.dart';
import 'package:kanoon_dadgostari/view/auth/verification_page/page/verification_page.dart';

import '../../../../app/app_pages.dart';
import '../../../widgets/customScaffold/customScaffold.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => WillPopScope(
        onWillPop: () => controller.back(),
        child: customScaffold(
            context: context,
            appBar: AppBar(
                title: const Text(
                  "ورود به اپلیکیشن",
                ),
                automaticallyImplyLeading: false),
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Padding(
                padding: EdgeInsets.all(largeSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("شماره تلفن همراه خود را وارد کنید",
                        style: Get.theme.textTheme.subtitle1),
                    Padding(
                      padding: EdgeInsets.only(top: standardSize),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Obx(
                          () => TextFormFieldWidget(

                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 11,
                            onChange: controller.phoneChanged,
                            textDirection: TextDirection.ltr,
                            errorText: controller.errorText.value,
                            hint: "09xxxxxxxxx",
                            textEditingController: controller.phoneTxtController,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: fullWidth,
                      child: Obx(
                        () => ElevatedButton(

                            onPressed: controller.isValid.value  ? () {

                              controller.submitFunction();

                            } : null,
                            child: const Text("ارسال کد تایید")),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
