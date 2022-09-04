import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/user/controller/lawyer_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import '../../auth/login_page/page/tst_page.dart';

class LawyerCardPage extends StatelessWidget {
  const LawyerCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LawyerController>(

      init: LawyerController(),

      builder: (controller) => customScaffold(
          bottomAppBar: BottomAppBar(
              elevation: 0,
              child: Container(
                margin: EdgeInsets.all(standardSize),
                child: Row(
                  children: [
                    Expanded(
                        flex: 10,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("درخواست جدید"))),
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                        flex: 10,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("درخواست جدید"))),
                  ],
                ),
              )),
          context: context,
          appBar: AppBar(
            title: const Text(
              "وکیل کارت",
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: largeSize, horizontal: largeSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                GestureDetector(onTap: () => Get.off(TestPage()) ,child: const BankCard()),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: standardSize),
                  child: Text("تاریخچه", style: Get.theme.textTheme.headline5,textAlign: TextAlign.start),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: controller.controller,
                  itemCount: 10,
                  itemBuilder: (context, index) => historyCard(),
                  ),
                )
              ],
            ),
          )),
    );
  }


}
Widget historyCard() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: mediumSize),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(standardRadius),
        color: AppColors.formFieldColor),
    padding: EdgeInsets.all(standardSize),
    child: Column(
      children: [
        historyWidgetItem(
            'assets/icons/Paper.svg', "نوع درخواست", "صدور کارت جدید"),
        Divider(),
        historyWidgetItem(
            'assets/icons/stickynote.svg', " تاریخ", "28/8/1401"),
        Divider(),
        historyWidgetItem(
            'assets/icons/clipboard-tick.svg', "وضعیت", "در حال بررسی"),
      ],
    ),
  );
}

Widget historyWidgetItem(String icon, String title, String subTitle) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: smallSize, horizontal: smallSize),
    child: Row(
      children: [
        SvgPicture.asset(icon),
        Padding(
          padding: EdgeInsets.only(right: smallSize),
          child: Text("${title} :",
              style: Get.theme.textTheme.subtitle1
                  ?.copyWith(color: AppColors.primaryColor)),
        ),
        Expanded(child: SizedBox()),
        Text(subTitle, style: Get.theme.textTheme.subtitle1),
      ],
    ),
  );
}
class BankCard extends GetView<LawyerController> {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>  AnimatedContainer(
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        duration: Duration(milliseconds: 1000),
        width: fullWidth,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(standardRadius))),
        height: controller.heightCard.value,
        child: Stack(children: [
          Positioned(
              top: -25,
              right: -15,
              child: SvgPicture.asset('assets/icons/dots_btm.svg')),
          Align(
              alignment: Alignment.center,
              child: Text(
                "6274 1212 0298 5289",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: fullWidth / 14,
                    fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: largeSize,
              left: largeSize,
              right: largeSize,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/ic_bank.png',
                    scale: 2,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "وضعیت : فعال",
                    style: Get.theme.textTheme.subtitle1!
                        .copyWith(color: Colors.white),
                  )
                ],
              )),
          Positioned(
              bottom: largeSize,
              left: largeSize,
              right: largeSize,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تاریخ انقضا : 02/04",
                    style: Get.theme.textTheme.subtitle1!
                        .copyWith(color: Colors.white),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "Cvv2 : 874",
                    style: Get.theme.textTheme.subtitle1!
                        .copyWith(color: Colors.white),
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
