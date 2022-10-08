
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/models/category_model/detail_category_model.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/widgets/image_widget.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';
import 'package:readmore/readmore.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../controller/welfare_center_detail_controller.dart';

class WelfareCenterDetailPage extends StatelessWidget {
  WelfareCenterDetailPage({Key? key, required this.title, required this.id})
      : super(key: key);
  final WelfareCenterDetailController controller =
      WelfareCenterDetailController();
  String title;

  String id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterDetailController>(
      init: controller,
      initState: (state) => controller.getDetailCategory(id),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: backIcon(),
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
                          _descWidget(title: 'تعـداد خریـد', count: controller.rpm.profile.id ?? 0),//todo fix this part from server
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.rpm.services.length,
                        itemBuilder: (context, index) =>
                            _serviceCard(controller.rpm.services[index]),
                      )
                    ],
                  ),
                ),
            onLoading: const Center(child: CupertinoActivityIndicator())),
        bottomNavigationBar: Padding(
          padding: EdgeInsetsDirectional.all(standardSize),
          child: progressButton(
            onTap: () {},
            isDisabled: true,
            text: "صورتحساب",
          ),
        ),
      ),
    );
  }

  Widget _bannerImage() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: SizedBox(
        width: fullWidth,
        height: fullHeight / 5,
        child: imageWidget(
          controller.rpm.profile.headerPic
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
            child: imageWidget(
                controller.rpm.profile.headerPic

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

  Widget _serviceCard(ServicesItem rpm) {
    WelfareCenterDetailController controller =
        Get.find<WelfareCenterDetailController>();
    return AnimatedContainer(
      duration: const Duration(microseconds: 400),
      curve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.only(
        bottom: standardSize,
        right: standardSize,
        left: standardSize,
      ),
      padding: EdgeInsets.only(
        bottom: standardSize,
        top: standardSize,
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
                    borderRadius: BorderRadius.circular(xxSmallRadius / 1.5),
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
                Expanded(child: _itemServiceCard("قیمت", "${rpm.price} تومان")),
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
                                style: Get.theme.textTheme.bodyText1!.copyWith(
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
                                    child: Text(
                                      controller.counter.value.toString(),
                                      style: Get.theme.textTheme.subtitle2,
                                      textAlign: TextAlign.center,
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
