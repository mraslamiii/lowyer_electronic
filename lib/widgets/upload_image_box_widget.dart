import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../res/colors/colors.dart';
import '../res/dimens/dimens.dart';
import 'avatar_image_circle.dart';

Widget uploadImageBoxWidget(
    {required VoidCallback onTap,
    String? hint,
    required Rx<File> file,
    BoxFit? boxFit,
    String? icon}) {
  return Obx(() {
    return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(xxLargeSize * 100),
        splashColor: AppColors.splashColor,
        child: Container(
          height: fullWidth / 5,
          width: fullWidth / 5,
          decoration: BoxDecoration(
              color: AppColors.factorCardColor,
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadowColor,
                    offset: Offset(0, 4),
                    blurRadius: 5,
                    spreadRadius: 0.5
                )
              ],
              shape: BoxShape.circle
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(xxLargeSize * 3),
            child: file.value.path != '' ?
              Image.file(
                file.value,
                fit: boxFit,
              ) : avatarImageCircle('assets/images/avatar.JPG'),
          ),
        )
        // DottedBorder(
        //   borderType: BorderType.RRect,
        //   radius: Radius.circular(xSmallRadius),
        //   dashPattern: [xSmallSize],
        //   padding: EdgeInsets.all(standardSize),
        //   color: const Color(0xffD1D5DB),
        //   child: ClipRRect(
        //       borderRadius: BorderRadius.circular(xSmallRadius),
        //       child: Center(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             SvgPicture.asset(
        //               "assets/ic_camera.svg",
        //               color: const Color(0xffD1D5DB),
        //             ),
        //             SizedBox(
        //               height: xSmallSize,
        //             ),
        //             Text(
        //               hint ?? "choose_photo".tr,
        //               textAlign: TextAlign.center,
        //               style: Get.theme.textTheme.bodyText2!.copyWith(
        //                 color: const Color(0xffD1D5DB),
        //               ),
        //             ),
        //           ],
        //         ),
        //       )),
        // ),
        );
  });
}
