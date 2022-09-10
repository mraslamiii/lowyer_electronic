import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:lottie/lottie.dart';

class SuccessSignupPage extends StatelessWidget {
  const SuccessSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: fullWidth,
        height: fullHeight,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: fullWidth / 3,
                  width: fullWidth / 3,
                  child: Lottie.asset('assets/icons/success.json')),
              Padding(
                padding: EdgeInsets.only(bottom: smallSize, top: smallSize),
                child: Text("ثبت نام با موفقیت انجام شد",
                    style: Get.theme.textTheme.subtitle1),
              ),
              Text("تا ساعتی دیگر همکاران ما با شما \n تماس خواهند گرفت",
                  style: Get.theme.textTheme.subtitle2
                      ?.copyWith(color: AppColors.descriptionColor2),
                  textAlign: TextAlign.center),
              TextButton(
                  onPressed: () => Get.offAllNamed(Routes.loginPage),
                  child: Text("برگشت به صفحه ورود"))
            ]),
      ),
    );
  }
}
