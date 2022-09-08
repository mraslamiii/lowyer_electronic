import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

import '../app/app_pages.dart';

class DeepLinkService extends GetxService {
  Future handleDynamicLinks() async {
    StreamSubscription sub;
    await getInitialLink();

    try {
      sub = getUriLinksStream().listen((Uri? uri) {
        var convertUriToString = uri.toString();

        String id = convertUriToString.replaceAll(RegExp('[^0-9]'), '');

        if (uri != null) {
          if (convertUriToString.contains("/welfareCenter/?id=")) {
            Get.toNamed(Routes.welfareCenterPageDetail);
          } else {
            Get.snackbar("آدرس نامعتبر", "بارکد اسکن شده معتبر نمیباشد");
          }
        }
      }, onError: (err) {
        print("onError");
      });
    } on PlatformException {
      print("PlatformException");
    } on Exception {
      print('Exception thrown');
    }
  }
}
