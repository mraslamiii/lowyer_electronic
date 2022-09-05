import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/view/Intro/splash_page/controller/splash_controller.dart';
import 'package:kanoon_dadgostari/view/base/home_page/controller/home_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../res/dimens/dimens.dart';
import '../../../auth/login_page/page/login_page.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../controller/welfare_center_controller.dart';

class WelfareCenterPage extends StatelessWidget {
  const WelfareCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterController>(
      init: WelfareCenterController(),
      builder: (controller) => customScaffold(
        appBar: AppBar(
          title: const Text(
            "مـرکز رفاهـی",
          ),
          leading: backIcon(),
          actions: [
            IconButton(
                splashColor: AppColors.splashColor,
                splashRadius: largeSize / 1.2,
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/ic_scan.svg'))
          ],
        ),
        context: context,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
            margin: EdgeInsets.only(
                top: standardSize, left: standardSize, right: standardSize),
            child:Text(
              "دسته بندی",
              style: Get.theme.textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.w600
              ),
            ) ,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mediumSize, horizontal: smallSize),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return menuItemWidget('assets/icons/peymant.png', 'درگاه خدمات');
                },
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget menuItemWidget(String picture, String title) {
    return Column(
      children: [
        Container(
          width: fullWidth / 4.5,
          height: fullWidth / 4.5,
          margin: EdgeInsets.only(bottom: smallSize),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(standardRadius),
              color: AppColors.formFieldColor),
          child: Image.asset(picture, scale: 1.2),
        ),
        Text(
          title,
          style: Get.theme.textTheme.subtitle2,
        )
      ],
    );
  }
}
