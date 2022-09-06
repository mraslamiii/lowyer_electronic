import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../res/colors/colors.dart';
import '../../res/dimens/dimens.dart';

Widget uploadImageBoxWidget(
    {required VoidCallback onTap,
    String? hint,
    String? title,
    required Rx<File> file,
    BoxFit? boxFit,
    String? icon}) {
  var theme = Get.theme;

  return Obx(() {
    return Column(
      children: [
        if (title != null)
          Container(
            margin: EdgeInsets.only(bottom: xSmallSize),
            // alignment: Alignment.c,
            child: Text(
              title,
              style: theme.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(xSmallRadius),
            splashColor: AppColors.splashColor,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(xSmallRadius),
              dashPattern: [xSmallSize],
              color: file.value.path == ''
                  ? const Color(0xffD1D5DB)
                  : Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(xSmallRadius),
                child: Stack(
                  children: [
                    if (file.value.path != '')
                      Positioned.fill(
                          child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent
                            ],
                          ).createShader(Rect.fromLTRB(
                              0, 160, rect.width, rect.height - 180));
                        },
                        blendMode: BlendMode.darken,
                        child: Image.file(
                          file.value,
                          fit: boxFit,
                        ),
                      )),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            icon ?? "assets/ic_camera.svg",
                            color: const Color(0xffD1D5DB),
                          ),
                          SizedBox(
                            height: xSmallSize,
                          ),
                          Text(
                            hint ?? "فایل مورد نظر را انتخاب کنید",
                            textAlign: TextAlign.center,
                            style: Get.theme.textTheme.bodyText2!.copyWith(
                              color: const Color(0xffD1D5DB),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
            ),
      ],
    );
  });
}
