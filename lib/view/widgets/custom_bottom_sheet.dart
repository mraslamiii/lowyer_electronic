import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/dimens/dimens.dart';

Future <T?> customBottomSheet<T>(
  BuildContext context,
  Widget child, {
  bool isDismissible = true,
  bool hasClose = false,
  Widget? button,
  double? height,
  EdgeInsetsGeometry? padding,
}) async {
  final theme = Get.theme;
  return showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: isDismissible ? true : false,
      isDismissible: isDismissible ? true : false,
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
                        hasClose
                            ? Container(
                                width: fullWidth,
                                height: kToolbarHeight,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: mediumSize),
                                            child: Text("بستن",style: Get.textTheme.subtitle2?.copyWith(color: Colors.red)),
                                          )),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: xxLargeSize * 1.5,
                                        height: xxSmallSize,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              largeRadius),
                                          color: theme.dividerColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: xxLargeSize * 1.5,
                                height: xxSmallSize,
                                margin: EdgeInsets.only(
                                  top: standardSize,
                                  bottom: mediumSize,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(largeRadius),
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
