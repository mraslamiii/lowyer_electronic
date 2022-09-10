import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/dimens/dimens.dart';

void internetErrorSnackBar() {
  Get.showSnackbar(
    const GetSnackBar(
      message: "مشکل در اتصال به اینترنت",
      backgroundColor: Colors.black54,
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
    ),
  );
}


void exeptionSnackBar(String title) {
  Get.showSnackbar(
     GetSnackBar(
      message: title,
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
    ),
  );
}
