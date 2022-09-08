import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/dimens/dimens.dart';

void customBottomSheet(
  BuildContext context,
  Widget child, {
  bool isDismissible = false,
  Widget? button,
  double? height,
  EdgeInsetsGeometry? padding,
}) {
  final theme = Get.theme;

  showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: isDismissible ? false : true,
      isDismissible: isDismissible ? false : true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, state) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(largeSize),
                  topLeft: Radius.circular(largeSize),
                ),
              ),
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: xxLargeSize * 1.5,
                          height: xxSmallSize,
                          margin: EdgeInsets.only(
                            top: standardSize,
                            bottom: mediumSize,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(largeRadius),
                            color: theme.dividerColor,
                          ),
                        ),
                        Container(
                          height: height,
                          margin: padding ??
                              EdgeInsets.symmetric(
                                horizontal: standardSize,
                              ),
                          child: child,
                        ),
                        if (button != null)
                          Container(
                            padding: EdgeInsetsDirectional.only(
                              start: standardSize,
                              end: standardSize,
                              bottom: standardSize,
                              top: xxSmallSize,
                            ),
                            decoration: BoxDecoration(
                              color: theme.backgroundColor,
                              // boxShadow: [BoxShadow(
                              //   color: theme.dividerColor,
                              //   spreadRadius: 0,
                              //   blurRadius: 0,
                              //   offset: const Offset(0,-0.9)
                              // )]
                            ),
                            child: button,
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
      });
}
