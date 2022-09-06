import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/widgets/image_widget.dart';
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
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: SizedBox(
                            width: fullWidth,
                            height: fullHeight / 5,
                            child: imageWidget(
                                "https://m3.healio.com/~/media/slack-news/stock-images/fm_im/u/ultraprocessed-foods.jpg")),
                      ),
                      Positioned(
                        right: standardSize,
                        bottom: 0,
                        child: SizedBox(
                            width: fullHeight / 10,
                            height: fullHeight / 10,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(xSmallRadius),
                                border: Border.all(width: 4,color: Colors.white)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(xSmallRadius),
                                child: imageWidget(
                                    "https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq"),
                              ),
                            )),
                      ),
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
                    Expanded(
                      flex:2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("تعـداد خدمـت",style: Get.theme.textTheme.bodyText1
                          !.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.w600)),
                          Text("4",style: Get.theme.textTheme.bodyText1),
                        ],
                      ),
                    ),
                    Container(
                      height: xxLargeSize,
                      width: 1,
                      color: AppColors.dividerColor,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("تعـداد خریـد",style: Get.theme.textTheme.bodyText1
                          !.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.w600)),
                          Text("2",style: Get.theme.textTheme.bodyText1),
                        ],
                      ),
                    ),
                    Container(
                      height: xxLargeSize,
                      width: 1,
                      color: AppColors.dividerColor,
                    ),
                    Expanded(
                      flex:2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("امتیاز",style: Get.theme.textTheme.bodyText1
                          !.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.w600)),
                          SizedBox(height: xSmallSize),
                          Text("160",style: Get.theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: standardSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: standardSize,right: standardSize,bottom: standardSize),
                  child: const Divider(),
                ),
                _historyCard(),
              ],
            ),
          )),
    );
  }
  Widget _historyCard() {
    return Container(
      margin: EdgeInsets.only(bottom: standardSize,right: standardSize,left: standardSize),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(xSmallRadius),
          color: AppColors.formFieldColor),
      padding: EdgeInsets.symmetric(horizontal: smallSize),
      child: Column(
        children: [
          _historyWidgetItem(
             "نـام خدمـت", "فـروشگــاه"),
          _historyWidgetItem(
              "تــوضیحــات", "با فروشگـاه رفـاه تخفیـف بگیـریـد با فروشگـاه رفـاه تخفیـف بگیـریـد با فروشگـاه رفـاه تخفیـف بگیـریـد با فروشگـاه رفـاه تخفیـف بگیـریـد"),
          _historyWidgetItem(
               "قیمت", "200,000 تومان"),
        ],
      ),
    );
  }

  Widget _historyWidgetItem(String title, String subTitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: smallSize),
          child: Text("$title :",
              style: Get.theme.textTheme.subtitle2
              !.copyWith(color: AppColors.primaryColor)),
        ),
        SizedBox(width: xxSmallSize),
        Expanded(
          child: Row(
            children: [
              Expanded(child: Text(subTitle, style: Get.theme.textTheme.subtitle2,maxLines: 3,overflow: TextOverflow.ellipsis,)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: xSmallSize),
                decoration: BoxDecoration(
                  color: AppColors.errorColor.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(xxSmallRadius / 1.5)
                ),
                child: Text("50%",style: Get.theme.textTheme.subtitle2!.copyWith(
                  color: Color(0xFFC62828)
                ),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
