import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';

class LawyerController extends GetxController {
  Rx<double> heightCard = 200.0.obs;
  ScrollController controller = ScrollController();

  @override
  void onInit() {
    super.onInit();

    changeSize();
  }

  void changeSize() {
    controller.addListener(() {
      if (controller.positions.first.userScrollDirection  ==
          ScrollDirection.reverse) {
        heightCard.value = 100;
      }else{
        heightCard.value = 200;
      }
    });
  }
}
