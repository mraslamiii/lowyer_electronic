import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget progressButton({
  required VoidCallback onTap,
  required String text,
  Color? textColor,
  ButtonStyle? customStyle,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: customStyle,
    child: Text(text,style: Get.theme.textTheme.bodyText1!.copyWith(
      fontWeight: FontWeight.w700,
      color: textColor ?? Colors.white,
    )),
  );
}
