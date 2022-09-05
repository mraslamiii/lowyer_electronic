import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/user/controller/lawyer_controller.dart';
import 'package:kanoon_dadgostari/view/user/history_page/binding/history_binding.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../widgets/back_widget/back_widget.dart';
import '../../widgets/progress_button/progress_button.dart';
import '../history_page/page/history_page.dart';

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
                        flex: 1,
                        child: SizedBox(
                          width: fullWidth,
                          child: progressButton(
                              onTap: () {}, text: "درخواست جدید"),
                        )),
                    SizedBox(
                      width: standardSize,
                    ),
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: fullWidth,
                          child: progressButton(
                              onTap: () {},
                              text: "مسدود کردن",
                              customStyle: ElevatedButton.styleFrom(
                                  foregroundColor: AppColors.splashColor,
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  backgroundColor:
                                      const Color(0xFFE0E0E0).withOpacity(0.28),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(smallRadius),
                                      side: BorderSide(
                                          width: 1,
                                          color: AppColors.primaryColor
                                              .withOpacity(0.18)))),
                              textColor:
                                  const Color(0xFF8C8A8A).withOpacity(0.80)),
                        )),
                  ],
                ),
              )),
          context: context,
          appBar: AppBar(
            title: const Text(
              "وکیل کارت",
            ),
            automaticallyImplyLeading: false,
            leading: backIcon(),
            actions: [
              IconButton(
                splashRadius: largeSize / 1.2,
                splashColor: AppColors.splashColor,
                icon: SvgPicture.asset(
                  "assets/icons/ic_history.svg",
                  width: iconSizeMedium,
                  height: iconSizeMedium,
                  color: Get.theme.iconTheme.color,
                ),
                onPressed: () {
                  Get.to(const HistoryPage(),binding: HistoryBinding());
                },
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: standardSize, horizontal: standardSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                _BankCard(),
              ],
            ),
          )),
    );
  }
}

class _BankCard extends GetView<LawyerController> {
  const _BankCard();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 1000),
        width: fullWidth,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.all(Radius.circular(smallRadius))),
        height: controller.heightCard.value,
        child: Stack(children: [
          Positioned(
              top: -25,
              right: -15,
              child: SvgPicture.asset('assets/icons/dots_btm.svg')),
          Positioned(
              bottom: -25,
              left: -15,
              child: SvgPicture.asset('assets/icons/dots_btm.svg')),
          Align(
              alignment: Alignment.center,
              child: Text(
                "6274 1212 0298 5289",
                textDirection: TextDirection.ltr,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: fullWidth / 17,
                    fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: standardSize,
              left: standardSize,
              right: standardSize,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/ic_bank.png',
                    scale: 2.5,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "وضعیت : فعال",
                    style: Get.theme.textTheme.subtitle2!
                        .copyWith(color: Colors.white),
                  )
                ],
              )),
          Positioned(
              bottom: standardSize,
              left: standardSize,
              right: standardSize,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تاریخ انقضا : 02/04",
                    style: Get.theme.textTheme.subtitle2!
                        .copyWith(color: Colors.white),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "Cvv2 : 874",
                    style: Get.theme.textTheme.subtitle2!
                        .copyWith(color: Colors.white),
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
