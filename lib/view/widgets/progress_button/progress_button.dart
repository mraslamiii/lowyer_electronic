import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget progressButton({
  required VoidCallback? onTap,
  required String text,
  bool isProgress = false,
  bool isDisabled = false,
  Color? textColor,
  ButtonStyle? customStyle,
}) {
  ThemeData theme = Get.theme;
  return ElevatedButton(
    onPressed: isDisabled ? null : onTap,
    style: customStyle,
    child: isProgress
        ? const CupertinoActivityIndicator()
        : Text(
            text,
            style: theme.textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.w700,
              color: textColor ?? Colors.white,
            ),
          ),
  );
}
