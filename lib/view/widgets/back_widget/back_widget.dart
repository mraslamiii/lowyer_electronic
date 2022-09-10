import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import '../../../res/colors/colors.dart';
import '../../../res/dimens/dimens.dart';

Widget backIcon({VoidCallback? onTap , Color? iconColor}) {
  return IconButton(
    splashRadius: largeSize / 1.2,
    splashColor: AppColors.splashColor,
    icon:
    RotatedBox(
      quarterTurns: 2,
      child: SvgPicture.asset(
        "assets/icons/ic_back.svg",
        color: iconColor ?? Get.theme.iconTheme.color,
      ),
    ),
    onPressed: onTap ?? () {
      Get.back();
    },
  );
}



Future<bool> backtoLogin() async {
  var result = await showOkCancelAlertDialog(
      context: Get.context!,
      cancelLabel: "ادامه",
      isDestructiveAction: true,
      builder: (context, child) => Theme(
        data: ThemeData(
          textTheme: Get.textTheme,
        ),
        child: Directionality(
            textDirection: TextDirection.rtl, child: child),
      ),
      defaultType: OkCancelAlertDefaultType.cancel,
      okLabel: "خروج",
      message: "برای خروج از فرایند ثبت نام اطمینان دارید؟",
      title: "انصراف از ثبت نام");

  if(result ==OkCancelResult.ok){
    Get.offAllNamed(Routes.loginPage);
  }

  print(result);
  return false;
}