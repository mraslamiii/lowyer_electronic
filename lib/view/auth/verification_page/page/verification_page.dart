import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/auth/verification_page/controller/verify_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:get/get.dart';

import '../../../../app/app_pages.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../widgets/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyController>(
      builder: (controller) => WillPopScope(
        onWillPop: controller.back,
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
                        child: PinCodeField(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: smallSize),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/ic_edit.svg',
                              color: AppColors.primaryColor),
                          Padding(
                              padding: EdgeInsets.only(right: xSmallSize),
                              child: Text(
                                "ویرایش شماره تلفن",
                                style: Get.theme.textTheme.subtitle2
                                    ?.copyWith(color: AppColors.primaryColor),
                              ))
                        ],
                      ),
                    ),
                    Expanded(child: const SizedBox()),
                    SizedBox(
                      width: fullWidth,
                      child: Obx(
                        () => ElevatedButton(
                            onPressed: !controller.isValid.value ? null : () {
                              Get.offAllNamed(Routes.signupPage);
                            },
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
