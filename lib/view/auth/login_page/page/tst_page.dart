import 'package:flutter/cupertino.dart';

import '../../../user/page/lowyer_card_page.dart';
import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/user/controller/lawyer_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customScaffold(
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
          padding:
          EdgeInsets.symmetric(vertical: largeSize, horizontal: largeSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BankCard2(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: standardSize),
                child: Text("تاریخچه", style: Get.theme.textTheme.headline5),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    historyCard(),
                    historyCard(),
                    historyCard(),
                    historyCard(),
                    historyCard(),
                    historyCard(),
                    historyCard(),
                    historyCard(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class BankCard2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: fullWidth,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(standardRadius))),
      height: fullHeight / 3,
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
    );
  }
}
