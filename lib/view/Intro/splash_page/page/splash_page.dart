import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/view/Intro/splash_page/controller/splash_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../res/dimens/dimens.dart';
import '../../../auth/login_page/page/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) => customScaffold(
        context: context,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: AnimatedSplashScreen(
            splashIconSize: Get.width,
            disableNavigation: true,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Colors.white,
            duration: 3000,
            animationDuration: const Duration(milliseconds: 1000),
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  height: fullWidth / 3.5,
                  width: fullWidth / 3.5,
                ),
                Padding(
                  padding: EdgeInsets.only(top: smallSize),
                  child: Text("درگاه خدمات الکترونیکی",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: AppColors.primaryColor)),
                ),
                Text("کانون وکلای دادگستری خراسان رضوی",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: AppColors.primaryColor)),
                AnimatedOpacity(
                  opacity: controller.isProgress.value ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: EdgeInsets.only(top: xxLargeSize),
                    child: SizedBox(
                      width: fullWidth / 13,
                      height: fullWidth / 13,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                )
              ],
            ),
            splashTransition: SplashTransition.scaleTransition,
            nextScreen: LoginPage(),
          ),
        ),
      ),
    );
  }
}
