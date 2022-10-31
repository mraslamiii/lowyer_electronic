import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:readmore/readmore.dart';

import '../../../../models/category_model/detail_category_model.dart';
import '../../../../models/entity/basket/service_entity.dart';
import '../../../../res/colors/colors.dart';
import '../../../../res/dimens/dimens.dart';
import '../../../../utilites/datetime_extentions.dart';
import '../../../../utilites/hive_utils/hive_utils.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../../widgets/image_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../basket_controller/basket_controller.dart';
import '../../payment_gateway/page/payment_gateway_page.dart';
import '../controller/checkout_controller.dart';

class CheckoutPage extends GetView<BasketController> {
  @override
  final BasketController controller = BasketController();

  CheckoutPage({super.key, required this.id});

  String id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasketController>(
        init: controller,
        initState: (state) => controller.box.values,
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text("صورتحساب"),
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: backIcon(),
            ),
            body: Stack(
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
                        itemCount: controller.box.length,
                        itemBuilder: (context, index) => _serviceCard(
                          context,
                          controller.box.values.toList()[index],
                        ),
                      ),
                      // SizedBox(height: fullHeight / 2.8,),
                    ],
                  ),
                ),
                // DraggableScrollableSheet(
                //   minChildSize: 0.4,
                //   initialChildSize: 0.4,
                //   maxChildSize: 0.4,
                //   builder: (
                //     BuildContext context,
                //     ScrollController scrollController,
                //   ) {
                //     return NotificationListener(
                //       onNotification:
                //           (OverscrollIndicatorNotification overScroll) {
                //         overScroll.disallowIndicator();
                //         return true;
                //       },
                //       child: SingleChildScrollView(
                //         child: Container(
                //           margin: EdgeInsets.only(
                //             top: xxSmallSize
                //           ),
                //           decoration: BoxDecoration(
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.black.withOpacity(0.06),
                //                 blurRadius: 29,
                //                 spreadRadius: 0,
                //               )
                //             ],
                //             borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(standardRadius),
                //               topRight: Radius.circular(standardRadius),
                //             ),
                //             color: AppColors.backgroundColor,
                //           ),
                //           child: SingleChildScrollView(
                //             controller: scrollController,
                //             padding: EdgeInsetsDirectional.all(standardSize),
                //             child: Column(
                //               children: [
                //                 Container(
                //                   decoration: BoxDecoration(
                //                     borderRadius:
                //                         BorderRadius.circular(xSmallRadius),
                //                     color: AppColors.formFieldColor,
                //                   ),
                //                   padding:
                //                       EdgeInsets.symmetric(horizontal: smallSize),
                //                   child: Column(
                //                     children: [
                //                       _factorItemWidget(
                //                         "جمع کـل",
                //                         "۱۲۰,۰۰۰ تـومان",
                //                       ),
                //                       const Divider(),
                //                       _factorItemWidget(
                //                         "تخفیـف",
                //                         "۴۰,۰۰۰ تـومان",
                //                       ),
                //                       const Divider(),
                //                       _factorItemWidget(
                //                         "مبلغ قابـل پرداخـت",
                //                         "۸۰,۰۰۰ تـومان",
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 SizedBox(height: standardSize),
                //                 Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           "مبلغ قابـل پرداخـت :",
                //                           style: Get.theme.textTheme.subtitle2
                //                               ?.copyWith(
                //                             color: const Color(0xFF8C8A8A)
                //                                 .withOpacity(0.80),
                //                           ),
                //                         ),
                //                         Text(
                //                           "۸۰,۰۰۰ تـومان",
                //                           style: Get.theme.textTheme.subtitle2
                //                               ?.copyWith(
                //                             fontWeight: FontWeight.w700,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       width: fullWidth / 2.5,
                //                       child: progressButton(
                //                         onTap: () => Get.to(PaymentGatewayPage()),
                //                         text: "پرداخت",
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),

            /*bottomNavigationBar: Padding(
          padding: EdgeInsets.all(standardSize),
          child: progressButton(
            onTap: () => Get.off(const SuccessPaymentPage()),
            text: "پرداخت",
          ),
        ),*/
            bottomNavigationBar: ValueListenableBuilder(
                valueListenable: Boxes.getBasketBox().listenable(),
                builder: (context, box, widget) {
                  return SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: xxSmallSize),
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
                                    formatter.format(int.parse(controller
                                        .calculatedTotal()
                                        .toStringAsFixed(0))),
                                  ),
                                  const Divider(),
                                  _factorItemWidget(
                                    "تخفیـف",
                                    formatter.format(int.parse(controller
                                        .discountTotal()
                                        .toStringAsFixed(0))),
                                  ),
                                  const Divider(),
                                  _factorItemWidget(
                                    "مبلغ قابـل پرداخـت",
                                    formatter.format(int.parse(
                                        controller.total().toStringAsFixed(0))),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: standardSize),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      formatter.format(int.parse(controller
                                          .total()
                                          .toStringAsFixed(0))),
                                      style: Get.theme.textTheme.subtitle2
                                          ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    width: fullWidth / 2.5,
                                    child: ValueListenableBuilder(
                                        valueListenable:
                                            Boxes.getBasketBox().listenable(),
                                        builder: (context, box, widget) {
                                          return progressButton(
                                            isDisabled:
                                                controller.box.values.isNotEmpty
                                                    ? false
                                                    : true,
                                            onTap: () {
                                              if (controller
                                                  .box.values.isNotEmpty) {
                                                Get.to(PaymentGatewayPage());
                                              }
                                            },
                                            text: "پرداخت",
                                          );
                                        }))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }

  Widget _serviceCard(BuildContext context, ServiceBasket rpm) {
    // CheckoutController controller = Get.find<CheckoutController>();
    return ValueListenableBuilder(
        valueListenable: Boxes.getBasketBox().listenable(),
        builder: (context, box, widget) {
          return controller.checkItemCount(rpm.id) != 0
              ? Stack(
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
                                          borderRadius: BorderRadius.circular(
                                              xSmallRadius),
                                          border: Border.all(
                                              width: 2, color: Colors.white),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              xxSmallRadius),
                                          child: imageWidget(rpm.image
                                              // "https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq",
                                              ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: xSmallSize),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _itemServiceCard(
                                            "نـام خدمـت",
                                            rpm.serviceName,
                                          ),
                                          SizedBox(height: xSmallSize),
                                          _itemServiceCard(
                                            "قیمت",
                                            formatter.format(int.parse(
                                                double.parse(rpm.price)
                                                    .toStringAsFixed(0))),
                                            hasDesc: true,
                                          ),
                                          SizedBox(height: xSmallSize),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "تخفیف:",
                                                style: Get
                                                    .theme.textTheme.subtitle2!
                                                    .copyWith(
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          xxSmallRadius / 1.5),
                                                ),
                                                child: Text(
                                                  '%${double.parse(rpm.discount).toStringAsFixed(0)}',
                                                  style: Get.theme.textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFFC62828),
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
                                    rpm.description,
                                  ),
                                ),
                                // Text(
                                //   "هدف فروشگاه‌‌‌ های نسـل جدیـد فراتر از تأمین کالاهـای هدف فروشگاه‌‌‌ های نسـل جدیـد فراتر از تأمین کالاهـای مورد نیاز مشتریان اسـت. فروشگاه‌هـا به دنبال خلـق مورد نیاز مشتریان اسـت. فروشگاه‌هـا به دنبال خلـق تجربه ای متفاوت دلنشین برای مشتریان است.",
                                //   style: Get.theme.textTheme.subtitle2,
                                // ),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: xSmallSize),
                                    decoration: BoxDecoration(
                                      color: AppColors.errorColor
                                          .withOpacity(0.16),
                                      borderRadius: BorderRadius.circular(
                                          xxSmallRadius / 1.5),
                                    ),
                                    child: Text(
                                      '%${double.parse(rpm.discount).toStringAsFixed(0)}',
                                      style: Get.theme.textTheme.subtitle2!
                                          .copyWith(
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
                                      child: _itemServiceCard("قیمت",
                                          "${formatter.format(int.parse(double.parse(rpm.price).toStringAsFixed(0)))} تومان",
                                          isLineThrough: rpm.discount.isNotEmpty
                                              ? true
                                              : false)),
                                  SizedBox(
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
                                              controller.increase(rpm.id);
                                              // controller.counter.value =
                                              // controller.counter.value + 1;
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
                                                controller
                                                    .checkItemCount(rpm.id)
                                                    .toString(),
                                                style: Get
                                                    .theme.textTheme.subtitle2,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.decrease(rpm.id);
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: controller.checkItemCount(
                                                          rpm.id) ==
                                                      0
                                                  ? AppColors.secondaryTextColor
                                                  : AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // );
                                    // }
                                  )
                                ],
                              ),
                            ),
                            rpm.discount.isNotEmpty
                                ? _itemServiceCard("قیمت",
                                    "${formatter.format(int.parse(controller.discountSingleItem().toStringAsFixed(0)))} تومان")
                                : const SizedBox(),
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
                            child: imageWidget(rpm.image
                                // "https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq",
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox();
        });
  }

  Widget _itemServiceCard(
    String title,
    String subTitle, {
    bool hasDesc = false,
    bool isLineThrough = false,
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
                        style: Get.theme.textTheme.subtitle2!.copyWith(
                            decoration: isLineThrough == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
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
