import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/connection_service/connection_status.dart';
import 'package:kanoon_dadgostari/utilites/utilities.dart';

import '../../../res/colors/colors.dart';
import '../no_internet_widget/no_internet_widget.dart';

Widget customScaffold({
  required BuildContext context,
  required Widget body,
  AppBar? appBar,
  Color? bgColor,
  BottomAppBar? bottomAppBar,
}) {
  // ConnectionStatusController noInternet = Get.find();

  return GestureDetector(
    onTap: () {
      closeKeyboard(context);
    },
    child: Scaffold(
      backgroundColor: bgColor ?? AppColors.backgroundColor,
      bottomNavigationBar: bottomAppBar,
      appBar: appBar,
      body: body,
      // body: noInternet.connectionStatus.value == ConnectionStatus.disconnect
      //     ? noInternetWidget()
      //     : body,
    ),
  );
}
