import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:readmore/readmore.dart';

import '../../../../models/category_model/detail_category_model.dart';
import '../../../../res/colors/colors.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../../widgets/image_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../payment_gateway/page/payment_gateway_page.dart';
import '../../success_payment_page/page/success_payment_page.dart';
import '../controller/checkout_controller.dart';

class CheckoutPage extends StatelessWidget {
  final CheckoutController controller = CheckoutController();

  CheckoutPage({super.key, required this.id});

  String id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: controller,
      initState: (state) => controller.getDetailCategory(id),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("صورتحساب"),
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: backIcon(),
        ),
        body: controller.obx(
          (state) => Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: standardSize),
                    Container(
                      margin: EdgeInsets.all(standardSize),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(xSmallRadius),
                        color: AppColors.formFieldColor,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: smallSize),
                      child: Column(
                        children: [
                          _factorItemWidget(
                            "پـذیرنـده",
                            "فـروشگـاه افـق",
                            icon: "assets/icons/ic_document.svg",
                          ),
                          const Divider(),
                          _factorItemWidget(
                            "شمـاره فـاکـتـور",
                            "۱۲۴۸۷۵۴۶",
                            icon: "assets/icons/ic_receipt_item.svg",
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.rpm.services.length,
                      itemBuilder: (context, index) => _serviceCard(
                        context,
                        controller.rpm.services[index],
                      ),
                    ),
                    SizedBox(height: fullHeight / 3,),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                minChildSize: 0.4,
                initialChildSize: 0.4,
                maxChildSize: 0.4,
                builder: (
                  BuildContext context,
                  ScrollController scrollController,
                ) {
                  return NotificationListener(
                    onNotification:
                        (OverscrollIndicatorNotification overScroll) {
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: xxSmallSize
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 29,
                              spreadRadius: 0,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(standardRadius),
                            topRight: Radius.circular(standardRadius),
                          ),
                          color: AppColors.backgroundColor,
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsetsDirectional.all(standardSize),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(xSmallRadius),
                                  color: AppColors.formFieldColor,
                                ),
                                padding:
                                    EdgeInsets.symmetric(horizontal: smallSize),
                                child: Column(
                                  children: [
                                    _factorItemWidget(
                                      "جمع کـل",
                                      "۱۲۰,۰۰۰ تـومان",
                                    ),
                                    const Divider(),
                                    _factorItemWidget(
                                      "تخفیـف",
                                      "۴۰,۰۰۰ تـومان",
                                    ),
                                    const Divider(),
                                    _factorItemWidget(
                                      "مبلغ قابـل پرداخـت",
                                      "۸۰,۰۰۰ تـومان",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: standardSize),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "مبلغ قابـل پرداخـت :",
                                        style: Get.theme.textTheme.subtitle2
                                            ?.copyWith(
                                          color: const Color(0xFF8C8A8A)
                                              .withOpacity(0.80),
                                        ),
                                      ),
                                      Text(
                                        "۸۰,۰۰۰ تـومان",
                                        style: Get.theme.textTheme.subtitle2
                                            ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: fullWidth / 2.5,
                                    child: progressButton(
                                      onTap: () => Get.to(PaymentGatewayPage()),
                                      text: "پرداخت",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          onLoading: const Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
        /*bottomNavigationBar: Padding(
          padding: EdgeInsets.all(standardSize),
          child: progressButton(
            onTap: () => Get.off(const SuccessPaymentPage()),
            text: "پرداخت",
          ),
        ),*/
      ),
    );
  }

  Widget _serviceCard(BuildContext context, ServicesItem rpm) {
    CheckoutController controller = Get.find<CheckoutController>();
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            customBottomSheet(
              context,
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: fullHeight / 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: fullHeight / 8,
                          height: fullHeight / 8,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(xSmallRadius),
                              border: Border.all(width: 2, color: Colors.white),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(xxSmallRadius),
                              child: imageWidget(
                                  controller.rpm.profile.headerPic
                                  // "https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq",
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(width: xSmallSize),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _itemServiceCard(
                                "نـام خدمـت",
                                rpm.serviceName,
                              ),
                              SizedBox(height: xSmallSize),
                              _itemServiceCard(
                                "قیمت",
                                rpm.price,
                                hasDesc: true,
                              ),
                              SizedBox(height: xSmallSize),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "تخفیف:",
                                    style:
                                        Get.theme.textTheme.subtitle2!.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: xxSmallSize),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: xSmallSize),
                                    decoration: BoxDecoration(
                                      color: AppColors.errorColor
                                          .withOpacity(0.16),
                                      borderRadius: BorderRadius.circular(
                                          xxSmallRadius / 1.5),
                                    ),
                                    child: Text(
                                      rpm.discount,
                                      style: Get.theme.textTheme.subtitle2!
                                          .copyWith(
                                        color: const Color(0xFFC62828),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: xSmallSize),
                    Padding(
                      padding: EdgeInsets.only(left: standardSize),
                      child: _itemServiceCard(
                        "تــوضیحــات",
                        "با فروشگـاه رفـاه تخفیـف بگیـریـد بـا لـذت",
                      ),
                    ),
                    Text(
                      "هدف فروشگاه‌‌‌ های نسـل جدیـد فراتر از تأمین کالاهـای هدف فروشگاه‌‌‌ های نسـل جدیـد فراتر از تأمین کالاهـای مورد نیاز مشتریان اسـت. فروشگاه‌هـا به دنبال خلـق مورد نیاز مشتریان اسـت. فروشگاه‌هـا به دنبال خلـق تجربه ای متفاوت دلنشین برای مشتریان است.",
                      style: Get.theme.textTheme.subtitle2,
                    ),
                    SizedBox(height: standardSize),
                  ],
                ),
              ),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(microseconds: 400),
            curve: Curves.fastLinearToSlowEaseIn,
            margin: EdgeInsets.only(
              top: xLargeSize,
              bottom: standardSize,
              right: standardSize,
              left: standardSize,
            ),
            padding: EdgeInsets.only(
              bottom: standardSize,
              top: xxLargeSize,
              right: standardSize,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(xSmallRadius),
              color: AppColors.formFieldColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: standardSize),
                  child: Row(
                    children: [
                      Expanded(
                        child: _itemServiceCard(
                          "نـام خدمـت",
                          rpm.serviceName,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: xSmallSize),
                        decoration: BoxDecoration(
                          color: AppColors.errorColor.withOpacity(0.16),
                          borderRadius:
                              BorderRadius.circular(xxSmallRadius / 1.5),
                        ),
                        child: Text(
                          rpm.discount,
                          style: Get.theme.textTheme.subtitle2!.copyWith(
                            color: const Color(0xFFC62828),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: standardSize),
                Padding(
                  padding: EdgeInsets.only(left: standardSize),
                  child: _itemServiceCard(
                    "تــوضیحــات",
                    rpm.description,
                    hasDesc: true,
                  ),
                ),
                SizedBox(height: smallSize),
                Padding(
                  padding: EdgeInsets.only(left: xxSmallSize),
                  child: Row(
                    children: [
                      Expanded(
                          child:
                              _itemServiceCard("قیمت", "${rpm.price} تومان")),
                      Obx(
                        () => controller.counter.value == 0
                            ? SizedBox(
                                width: fullWidth / 2.6,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: standardSize,
                                  ),
                                  // width: fullWidth,
                                  height: fullHeight / 16,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.counter.value++;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(xSmallRadius),
                                      ),
                                    ),
                                    child: Text(
                                      "افزودن",
                                      style: Get.theme.textTheme.bodyText1!
                                          .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Obx(
                                () => SizedBox(
                                  width: fullWidth / 2.6,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        xSmallRadius,
                                      ),
                                    ),
                                    // width: fullWidth,
                                    height: fullHeight / 16,
                                    margin: EdgeInsetsDirectional.only(
                                      end: standardSize,
                                    ),
                                    padding: EdgeInsetsDirectional.only(
                                      start: xSmallSize,
                                      end: xSmallSize,
                                    ),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.counter.value =
                                                controller.counter.value + 1;
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Get.theme.primaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              controller.counter.value
                                                  .toString(),
                                              style:
                                                  Get.theme.textTheme.subtitle2,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (controller.counter.value != 0) {
                                              controller.counter.value =
                                                  controller.counter.value - 1;
                                            }
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: controller.counter.value == 0
                                                ? AppColors.secondaryTextColor
                                                : AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: SizedBox(
            width: fullWidth / 4,
            height: fullWidth / 5.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(xSmallRadius),
                border: Border.all(width: 2, color: Colors.white),
              ),
              margin: EdgeInsetsDirectional.only(
                start: largeSize,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(xxSmallRadius),
                child: imageWidget(controller.rpm.profile.headerPic
                    // "https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq",
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _itemServiceCard(
    String title,
    String subTitle, {
    bool hasDesc = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title :",
          style: Get.theme.textTheme.subtitle2!.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(width: xxSmallSize),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: hasDesc
                    ? ReadMoreText(
                        subTitle,
                        trimLines: 1,
                        colorClickableText: Get.theme.primaryColor,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'بیشتر',
                        style: Get.theme.textTheme.subtitle2,
                        trimExpandedText: '  کمتر',
                      )
                    : Text(subTitle,
                        style: Get.theme.textTheme.subtitle2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _factorItemWidget(
    String title,
    String subTitle, {
    String? icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (icon != null) SvgPicture.asset(icon),
            Padding(
              padding: EdgeInsets.only(
                right: smallSize,
                top: smallSize,
                bottom: smallSize,
              ),
              child: Text("$title :",
                  style: Get.theme.textTheme.subtitle2!
                      .copyWith(color: AppColors.primaryColor)),
            ),
          ],
        ),
        SizedBox(width: xxSmallSize),
        Flexible(
            child: Text(
          subTitle,
          style: Get.theme.textTheme.subtitle2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )),
      ],
    );
  }
}
