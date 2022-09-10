import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget progressButton({
  required VoidCallback? onTap,
  required String text,
  bool isProgress = false,
  Color? textColor,
  ButtonStyle? customStyle,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: customStyle,
    child: isProgress
        ? const CupertinoActivityIndicator()
        : Text(text,
            style: Get.theme.textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.w700,
              color: textColor ?? Colors.white,
            )),
  );
}
