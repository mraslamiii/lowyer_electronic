import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/auth/verification_page/controller/verify_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';

import '../../login_page/page/login_page.dart';
import '../widgets/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  late String phone;

  VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyController>(
      initState: (state) {
        phone = Get.arguments as String;
      },
      builder: (controller) => customScaffold(
          context: context,
          appBar: AppBar(
            title: const Text(
              "ورود به اپلیکیشن",
            ),
          ),
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Padding(
              padding: EdgeInsets.all(largeSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("کد پیامک شده را وارد کنید",
                      style: Get.theme.textTheme.subtitle1),
                  Padding(
                    padding: EdgeInsets.only(top: standardSize),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeField(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(LoginPage());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: smallSize),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/ic_edit_underline.svg',
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
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: fullWidth,
                    child: Obx(
                      () => progressButton(
                          isProgress: controller.isBusyLogin.value,
                          onTap: controller.isValid.value &&
                                  controller.isBusyLogin.isFalse
                              ? () {
                                  controller.fetchData(phone);
                                }
                              : null,
                          text: "ارسال کد تایید"),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
