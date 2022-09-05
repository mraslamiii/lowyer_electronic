import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget progressButton({
  required VoidCallback onTap,
  required String text,
}) {
  return ElevatedButton(
    onPressed: onTap,
    child: Text(text,style: Get.theme.textTheme.bodyText1!.copyWith(
      fontWeight: FontWeight.w700,
    )),
  );
}
