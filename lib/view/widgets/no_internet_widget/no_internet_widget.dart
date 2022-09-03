import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Widget noInternetWidget (){
  return Center(
    child: Container(
      width: Get.width / 5,
      height: Get.height / 5,
      child:  Lottie.asset('assets/icons/no_internet.json'),
    ),
  );
}