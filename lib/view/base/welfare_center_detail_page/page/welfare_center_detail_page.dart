import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../controller/welfare_center_detail_controller.dart';

class WelfareCenterDetailPage extends StatelessWidget {
  const WelfareCenterDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterDetailController>(
      init: WelfareCenterDetailController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "مرکز خرید پروما",
            ),
            automaticallyImplyLeading: false,
            leading: backIcon(),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(standardSize),
            child: Column(
              children: [
              ],
            ),
          )),
    );
  }
}
