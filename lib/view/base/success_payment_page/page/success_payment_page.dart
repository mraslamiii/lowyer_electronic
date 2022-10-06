import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';
import 'package:lottie/lottie.dart';

class SuccessPaymentPage extends StatelessWidget {
  const SuccessPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: fullWidth,
        height: fullHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: fullWidth / 3,
              width: fullWidth / 3,
              child: Lottie.asset('assets/icons/payment_success.json'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: smallSize,
                horizontal: xxLargeSize,
              ),
              child: Text(
                "پـرداخت شمـا بـرای فاکتـور شمـاره : ۲۸۹۸۳۹۲۹۷۸۲۰۵۹۴۲ بـا موفقیـت انجـام شد.",
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.subtitle1,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: fullWidth,
        margin: EdgeInsets.all(standardSize),
        child: progressButton(
          onTap: () => Get.back(),
          text: "بازگشت",
        ),
      ),
    );
  }
}
