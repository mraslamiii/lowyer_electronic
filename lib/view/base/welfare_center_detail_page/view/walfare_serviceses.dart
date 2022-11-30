import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanoon_dadgostari/view/base/basket_controller/basket_controller.dart';
import 'package:kanoon_dadgostari/view/base/welfare_center_detail_page/controller/welfare_center_detail_controller.dart';
import 'package:readmore/readmore.dart';

import '../../../../models/category_model/detail_category_model.dart';
import '../../../../models/entity/basket/service_entity.dart';
import '../../../../res/colors/colors.dart';
import '../../../../res/dimens/dimens.dart';
import '../../../../utilites/hive_utils/hive_utils.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../../widgets/image_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../checkout_page/page/checkout_page.dart';

class WalfareServicePage extends GetView<WelfareCenterDetailController> {
  WalfareServicePage({Key? key}) : super(key: key);
  final WelfareCenterDetailController controller =
      Get.put(WelfareCenterDetailController());

  final BasketController cartController = Get.put(BasketController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterDetailController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsetsDirectional.all(standardSize),
          child: ValueListenableBuilder(
              valueListenable: Boxes.getBasketBox().listenable(),
              builder: (context, box, widget) {
                return progressButton(
                  onTap: () {
                    Get.to(CheckoutPage(
                      id: controller.rpm.profile.id.toString(),
                    ));
                  },
                  isDisabled:
                      cartController.box.values.isNotEmpty ? false : true,
                  text: "صورتحساب",
                );
              }),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("سرویس ها"),
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  )),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        _serviceCard(context, controller.rpm.services[index]),
                    childCount: controller.rpm.services.length))
          ],
        ),
      ),
    );
  }

  Widget _serviceCard(BuildContext context, ServicesItem rpm) {
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
                      ValueListenableBuilder(
                        valueListenable: Boxes.getBasketBox().listenable(),
                        builder: (context, box, widget) {
                          return cartController.checkItemCount(rpm.id) == 0
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
                                        var item = ServiceBasket(
                                            image: rpm.image,
                                            acceptorProfileId:
                                                rpm.acceptorProfileId,
                                            companyShares: rpm.companyShares,
                                            createdAt: rpm.createdAt,
                                            price: rpm.price,
                                            description: rpm.description,
                                            quantity: 0,
                                            id: rpm.id,
                                            discount: rpm.discount,
                                            status: rpm.status,
                                            updatedAt: rpm.updatedAt,
                                            endDate: rpm.endDate,
                                            lawyerCenter: rpm.lawyerCenter,
                                            serviceName: rpm.serviceName,
                                            startDate: rpm.startDate
                                            // itemTotal: 0,
                                            );
                                        // var item = BasketItem(
                                        //     id: rpm.id,
                                        //     // quantity: rpm.quantity,
                                        //     status: rpm.status,
                                        //     description: rpm.description,
                                        //     createdAt: rpm.createdAt,
                                        //     updatedAt: rpm.updatedAt,
                                        //     image: rpm.image,
                                        //     acceptorProfileId: rpm.acceptorProfileId,
                                        //     companyShares: rpm.companyShares,
                                        //     discount: rpm.discount,
                                        //     endDate: rpm.endDate,
                                        //     lawyerCenter: rpm.lawyerCenter,
                                        //     price: 100,
                                        //     serviceName: rpm.serviceName,
                                        //     startDate: rpm.startDate
                                        // );
                                        cartController.addToCart(item);
                                        cartController.increase(rpm.id);
                                        debugPrint(
                                            '${cartController.checkItemCount(rpm.id)}');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              xSmallRadius),
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
                              : SizedBox(
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
                                            cartController.increase(rpm.id);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Get.theme.primaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            cartController
                                                .checkItemCount(rpm.id)
                                                .toString(),
                                            style:
                                                Get.theme.textTheme.subtitle2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (cartController
                                                    .checkItemCount(rpm.id) !=
                                                0) {
                                              cartController.decrease(rpm.id);
                                            }
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: cartController
                                                        .checkItemCount(
                                                            rpm.id) ==
                                                    0
                                                ? AppColors.secondaryTextColor
                                                : AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        },
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
}
