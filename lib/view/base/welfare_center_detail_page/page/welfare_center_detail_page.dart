import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/widgets/image_widget.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';
import 'package:readmore/readmore.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../controller/welfare_center_detail_controller.dart';

class WelfareCenterDetailPage extends StatelessWidget {
  const WelfareCenterDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterDetailController>(
      init: WelfareCenterDetailController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "مرکز خرید پروما",
            ),
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: backIcon(),
          ),
          body: SingleChildScrollView(
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
                SizedBox(
                  height: standardSize,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _descWidget(title: 'تعـداد خدمـت', count: '4'),
                    Container(
                      height: xxLargeSize,
                      width: 1,
                      color: AppColors.dividerColor,
                    ),
                    _descWidget(title: 'تعـداد خریـد', count: '2'),
                    Container(
                      height: xxLargeSize,
                      width: 1,
                      color: AppColors.dividerColor,
                    ),
                    _descWidget(title: 'امتیاز', count: '160'),
                  ],
                ),
                SizedBox(
                  height: standardSize,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: standardSize,
                      right: standardSize,
                      bottom: standardSize),
                  child: const Divider(),
                ),
                _serviceCard(),
              ],
            ),
          )),
    );
  }

  Widget _bannerImage(){
    return  Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: SizedBox(
          width: fullWidth,
          height: fullHeight / 5,
          child: imageWidget(
              "https://m3.healio.com/~/media/slack-news/stock-images/fm_im/u/ultraprocessed-foods.jpg")),
    );
  }

  Widget _avatarImage(){
    return Positioned(
      right: largeSize / 1.2,
      bottom: 0,
      child: SizedBox(
          width: fullHeight / 10,
          height: fullHeight / 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(xSmallRadius),
                border: Border.all(
                    width: 4, color: Colors.white)),
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(xxSmallRadius),
              child: imageWidget(
                  "https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq"),
            ),
          )),
    );
  }

  Widget _descWidget({required String title,required String count}){
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: Get.theme.textTheme.bodyText1!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: xSmallSize),
          Text(count, style: Get.theme.textTheme.headline6),
        ],
      ),
    );
  }

  Widget _serviceCard() {
    WelfareCenterDetailController controller = Get.find<WelfareCenterDetailController>();
    return AnimatedContainer(
      duration: const Duration(microseconds: 400),
      curve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.only(
          bottom: standardSize, right: standardSize, left: standardSize),
      padding: EdgeInsets.only(
          bottom: standardSize, top: standardSize, right: standardSize),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(xSmallRadius),
          color: AppColors.formFieldColor),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: standardSize),
            child: Row(
              children: [
                Expanded(
                  child: _itemServiceCard(
                    "نـام خدمـت",
                    "فـروشگــاه",
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: xSmallSize),
                  decoration: BoxDecoration(
                      color: AppColors.errorColor.withOpacity(0.16),
                      borderRadius: BorderRadius.circular(xxSmallRadius / 1.5)),
                  child: Text(
                    "50%",
                    style: Get.theme.textTheme.subtitle2!
                        .copyWith(color: const Color(0xFFC62828)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: standardSize,
          ),
          Padding(
            padding: EdgeInsets.only(left: standardSize),
            child: _itemServiceCard("تــوضیحــات",
                "با فروشگـاه رفـاه تخفیـف بگیـریـد با فروگـاه رفـاه تخفیـف بگیـریـد با فروشگـاه رفـاه تخفیـف بگیـریـد با فروشگـاه رفـاه تخفیـف بگیـریـد",
                hasDesc: true),
          ),
          SizedBox(
            height: xxSmallSize,
          ),
          Padding(
            padding: EdgeInsets.only(left: xxSmallSize),
            child: Row(
              children: [
                Expanded(child: _itemServiceCard("قیمت", "200,000 تومان")),
                _counterBoxWidget(controller.counter),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: standardSize, top: standardSize),
              width: fullWidth,
              child: progressButton(
                  onTap: () {
                    if (controller.counter.value < 1) {
                      controller.counter.value++;
                    }
                  },
                  text: "افــزودن"))
        ],
      ),
    );
  }

  Widget _itemServiceCard(String title, String subTitle, {bool hasDesc = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title :",
            style: Get.theme.textTheme.subtitle2!
                .copyWith(color: AppColors.primaryColor)),
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

  Widget _counterBoxWidget(RxInt count) {
    return Obx(() => AnimatedOpacity(
          opacity: count.value != 0 ? 1 : 0,
          duration: const Duration(milliseconds: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: count.value != 0
                    ? () {
                        count.value++;
                      }
                    : () {},
                color: Get.theme.primaryColor,
              ),
              Container(
                alignment: Alignment.center,
                width: xLargeSize,
                height: xLargeSize,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(xSmallRadius),
                    color: AppColors.primaryColor.withOpacity(0.1),
                    border: Border.all(
                        color: AppColors.primaryColor.withOpacity(0.18),
                        width: 1)),
                child: Text(count.value.toString(),
                    style: Get.theme.textTheme.bodyText1),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: count.value != 0
                    ? () {
                        if (count.value != 0) {
                          count.value--;
                        }
                      }
                    : () {},
                color: count.value == 0
                    ? const Color(0xFF787171).withOpacity(0.8)
                    : Get.theme.primaryColor,
              ),
            ],
          ),
        ));
  }

}
