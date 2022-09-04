import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/auth/success_signup_page/succses_signup_page.dart';
import 'package:kanoon_dadgostari/view/auth/verification_page/controller/verify_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';

import '../../../../app/app_pages.dart';

class VerifyDetailsPage extends StatelessWidget {
  VerifyDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyController>(
      builder: (controller) => customScaffold(
          context: context,
          appBar: AppBar(
              title: const Text(
                "تایید اطلاعات",
              ),
              automaticallyImplyLeading: false),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: largeSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: smallSize, left: largeSize, right: largeSize),
                  child: Text("آیا اطلاعات زیر متعلق به شماست؟",
                      style: Get.theme.textTheme.subtitle2
                          ?.copyWith(color: AppColors.primaryColor)),
                ),
                Container(
                  width: fullWidth,
                  margin: EdgeInsets.symmetric(horizontal: largeSize),
                  decoration: BoxDecoration(
                      color: AppColors.formFieldColor,
                      borderRadius: BorderRadius.circular(standardRadius)),
                  child: Column(
                    children: [
                      infoWidget("نام", "حمیدرضا"),
                      infoWidget("نام خانوادگی", "اسلمی"),
                      infoWidget("نام پدر", "علیرضا"),
                      infoWidget("کد ملی", "092645445"),
                      infoWidget("شماره شناسنامه", "4781062", isLast: true),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: largeSize),
                  child: SizedBox(
                    width: fullWidth,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.offAll(const SuccessSignupPage());
                        },
                        child: const Text("تایید اطلاعات")),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget infoWidget(String title, String value, {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: mediumSize, vertical: smallSize),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: smallSize),
                child:
                    Icon(Icons.circle, color: Colors.black, size: xxSmallSize),
              ),
              Text("${title} : "),
              Text(value),
            ],
          ),
        ),
        isLast
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: mediumSize),
                child: Divider(thickness: 1.2),
              )
      ],
    );
  }
}