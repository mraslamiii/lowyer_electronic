// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanoon_dadgostari/models/category_model/detail_category_model.dart';
import 'package:kanoon_dadgostari/models/entity/basket/service_entity.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/utilites/datetime_extentions.dart';
import 'package:kanoon_dadgostari/view/widgets/image_widget.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:readmore/readmore.dart';
import '../../../../map_page.dart';
import '../../../../preview_map_page.dart';
import '../../../../utilites/hive_utils/hive_utils.dart';
import '../../../../widgets/error_widget.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../basket_controller/basket_controller.dart';
import '../../checkout_page/page/checkout_page.dart';
import '../controller/welfare_center_detail_controller.dart';

class WelfareCenterDetailPage extends StatelessWidget {
  WelfareCenterDetailPage({Key? key, this.title, this.id}) : super(key: key);

  String? title;
  String? id;


  final WelfareCenterDetailController controller =
      Get.put(WelfareCenterDetailController());
  final BasketController cartController = Get.put(BasketController());
  final theme = Get.theme;

  // RxBool isAddToCart = false.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterDetailController>(
        init: controller,
        initState: (state) => controller.getDetailCategory(id ?? ''),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(
                  title ?? '',
                ),
                elevation: 0,
                automaticallyImplyLeading: false,
                leading: backIcon(),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      customBottomSheet(
                        context,
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ListView(
                            padding: EdgeInsetsDirectional.only(
                              bottom: fullHeight / 18,
                            ),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              _sheetItem(
                                context: context,
                                title: 'www.shop.com',
                                icon: 'assets/icons/ic_global.svg',
                                isFirst: true,
                              ),
                              _sheetItem(
                                context: context,
                                title: 'instagram.shop',
                                icon: 'assets/icons/ic_instagram.svg',
                              ),
                              _sheetItem(
                                context: context,
                                title: 'whatsapp.shop',
                                icon: 'assets/icons/ic_whatsapp.svg',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              body: controller.obx(
                (state) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: fullHeight / 4,
                        child: Stack(
                          children: [
                            _bannerImage(),
                            _avatarImage(),
                          ],
                        ),
                      ),
                      SizedBox(height: standardSize),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _descWidget(
                              title: 'تعـداد خدمـت',
                              count: controller.rpm.services.length),
                          Container(
                            height: xxLargeSize,
                            width: 1,
                            color: AppColors.dividerColor,
                          ),
                          _descWidget(
                              title: 'تعـداد خریـد',
                              count: controller.rpm.profile.id ?? 0),
                          //todo fix this part from server
                        ],
                      ),
                      SizedBox(height: standardSize),
                      Padding(
                        padding: EdgeInsets.only(
                          left: standardSize,
                          right: standardSize,
                          bottom: standardSize,
                        ),
                        child: const Divider(),
                      ),
                      Container(
                        width: fullWidth,
                        margin: EdgeInsetsDirectional.only(start: standardSize,bottom: standardSize),
                        child: Text('موقعیت مکانی',style: theme.textTheme.subtitle1,
                        textAlign: TextAlign.start,
                        ),
                      ),

                      Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              margin: EdgeInsetsDirectional.only(start: standardSize,end: standardSize),
                              width: fullWidth,
                              height: fullHeight / 4,
                              child: PreViewMapPage(
                                lat: 36.6554,
                                long: 56.55454,
                                // mapController: controller.mapController,
                                // pickerMapController: controller.pickerController,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.off(MapPage());
                              MapsLauncher.launchCoordinates(36.6554, 56.55454,
                                  'Google Headquarters are here');
                            },
                            child: Container(
                              width: fullWidth,
                              height: fullHeight / 4,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.all(standardSize),
                        width: fullWidth,
                        child: progressButton(
                            onTap: () => MapsLauncher.launchCoordinates(36.6554,
                                56.55454, 'Google Headquarters are here'),
                            text: 'رفتن به این موقعیت مکانی'),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.rpm.services.length,
                        itemBuilder: (context, index) => _serviceCard(
                            context, controller.rpm.services[index]),
                      )
                    ],
                  ),
                ),
                onLoading: const Center(child: CupertinoActivityIndicator()),
                onError: (error) => errorWidget(
                    onTap: () {
                      controller.getDetailCategory(id ?? '');
                    },
                    isBusy: false.obs),
              ),
              bottomNavigationBar: controller.isError == false
                  ? Padding(
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
                              isDisabled: cartController.box.values.isNotEmpty
                                  ? false
                                  : true,
                              text: "صورتحساب",
                            );
                          }),
                    )
                  : const SizedBox(),
            ));
  }

  Widget _bannerImage() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: SizedBox(
        width: fullWidth,
        height: fullHeight / 5,
        child: imageWidget(controller.rpm.profile.headerPic
            // "https://m3.healio.com/~/media/slack-news/stock-images/fm_im/u/ultraprocessed-foods.jpg",
            ),
      ),
    );
  }

  Widget _avatarImage() {
    return Positioned(
      right: largeSize / 1.2,
      bottom: 0,
      child: SizedBox(
        width: fullHeight / 10,
        height: fullHeight / 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(xSmallRadius),
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(xxSmallRadius),
            child: imageWidget(controller.rpm.profile.headerPic

                // "https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq",
                ),
          ),
        ),
      ),
    );
  }

  Widget _descWidget({required String title, required int count}) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Get.theme.textTheme.bodyText1!.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: xSmallSize),
          Text('$count', style: Get.theme.textTheme.headline6),
        ],
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
                              child: imageWidget(rpm.image
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
                                formatter.format(int.parse(
                                    double.parse(rpm.price)
                                        .toStringAsFixed(0))),
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
                                      '%${double.parse(rpm.discount).toStringAsFixed(0)}',
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
                        padding: EdgeInsets.symmetric(horizontal: xSmallSize),
                        decoration: BoxDecoration(
                          color: AppColors.errorColor.withOpacity(0.16),
                          borderRadius:
                              BorderRadius.circular(xxSmallRadius / 1.5),
                        ),
                        child: Text(
                          '%${double.parse(rpm.discount).toStringAsFixed(0)}',
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
                          child: _itemServiceCard("قیمت",
                              "${formatter.format(int.parse(double.parse(rpm.price).toStringAsFixed(0)))} تومان",
                              isLineThrough:
                                  rpm.discount.isNotEmpty ? true : false)),
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
                _itemServiceCard("قیمت با تخفیف",
                    "${formatter.format(int.parse(cartController.discountSingleItem().toStringAsFixed(0)))} تومان")
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
    );
  }

  Widget _sheetItem({
    required BuildContext context,
    required String title,
    required String icon,
    bool isFirst = false,
    VoidCallback? onTap,
  }) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Ink(
        color: Colors.black54,
        child: InkWell(
          onTap: onTap,
          // splashColor: AppColors.splashColor,
          child: Column(
            children: [
              if (!isFirst)
                Divider(
                  color: AppColors.dividerColor,
                  height: 0.8,
                ),
              Container(
                padding: EdgeInsets.only(
                  top: standardSize,
                  bottom: standardSize,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: smallSize),
                      child: SvgPicture.asset(
                        icon,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Get.theme.textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
}
