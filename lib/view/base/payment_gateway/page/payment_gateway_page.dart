import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';

import '../../../../res/colors/colors.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/custom_radio_item.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../success_payment_page/page/success_payment_page.dart';
import '../controller/payment_gateway_controller.dart';

class PaymentGatewayPage extends StatelessWidget {
  final PaymentGatewayController controller = PaymentGatewayController();

  PaymentGatewayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentGatewayController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("درگاه پرداخت"),
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: backIcon(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(standardSize),
          child: Column(
            children: [
              Obx(
                () => customRadioItem(
                  selected: controller.selectedGateway,
                  index: 0,
                  iconWidget: Padding(
                    padding: EdgeInsetsDirectional.only(end: smallSize),
                    child: SvgPicture.asset(
                      "assets/icons/ic_cards.svg",
                      color: controller.selectedGateway.value == 0
                          ? AppColors.primaryColor
                          : const Color(0xFF8C8A8A).withOpacity(0.80),
                      width: iconSizeLarge,
                      height: iconSizeLarge,
                    ),
                  ),
                  name: "پرداخت اینترنتی",
                ),
              ),
              Obx(
                () => customRadioItem(
                  selected: controller.selectedGateway,
                  index: 1,
                  iconWidget: Padding(
                    padding: EdgeInsetsDirectional.only(end: smallSize),
                    child: SvgPicture.asset(
                      "assets/icons/ic_wallet.svg",
                      width: iconSizeMedium,
                      height: iconSizeMedium,
                      color: controller.selectedGateway.value == 1
                          ? AppColors.primaryColor
                          : const Color(0xFF8C8A8A).withOpacity(0.80),
                    ),
                  ),
                  name: "پرداخت از کیف پول",
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(standardSize),
          child: progressButton(
            onTap: () => Get.off(const SuccessPaymentPage()),
            text: "پرداخت",
          ),
        ),
      ),
    );
  }
}
