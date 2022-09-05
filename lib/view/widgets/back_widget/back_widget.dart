import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../res/colors/colors.dart';
import '../../../res/dimens/dimens.dart';

Widget backIcon({VoidCallback? onTap , Color? iconColor}) {
  return IconButton(
    splashRadius: standardSize,
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

