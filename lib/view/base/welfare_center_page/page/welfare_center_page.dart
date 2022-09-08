import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/view/base/scan_search_page/page/scan_search_page.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import '../../../../res/dimens/dimens.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/image_widget.dart';
import '../controller/welfare_center_controller.dart';


class WelfareCenterPage extends StatelessWidget {
  WelfareCenterPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterController>(
      init: WelfareCenterController(),
      builder: (controller) => customScaffold(
        appBar: AppBar(
          title: const Text(
            "مـرکز رفاهـی",
          ),
          leading: backIcon(),
          actions: [
            IconButton(
                splashColor: AppColors.splashColor,
                splashRadius: largeSize / 1.2,
                onPressed: () async{
                  Get.toNamed(Routes.scan_search_page);
                },
                icon: SvgPicture.asset('assets/icons/ic_scan.svg'))
          ],
        ),
        context: context,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(
                top: standardSize, left: standardSize, right: standardSize),
            child: Text(
              "دسته بندی",
              style: Get.theme.textTheme.headline6
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: fullWidth / 1.95,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  top: mediumSize, bottom: mediumSize),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.titles.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsetsDirectional.only(
                          end: standardSize,
                          start: index == 0 ? standardSize : 0),
                      child: categoryWidget(controller.images[index], controller.titles[index]));
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: standardSize, left: standardSize, right: standardSize),
            child: Text(
              "مراکز خرید",
              style: Get.theme.textTheme.headline6
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: fullWidth / 1.7,
            width: fullWidth,
            margin: EdgeInsetsDirectional.only(
                top: mediumSize,
                bottom: mediumSize),
            child:
                  ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsetsDirectional.only(
                          end: standardSize,
                          start: index == 0 ? standardSize : 0),
                      child: shoppingCenterWidget(
                          controller.shoppingImages[index],
                          'مرکز خرید پروما',
                          '4.8',
                          'لورم ایپسوم لورم ایپسوم لورم ایپسوم'));
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget categoryWidget(String picture, String title) {
    return Column(
      children: [
        Container(
          width: fullWidth / 3,
          height: fullWidth / 3,
          margin: EdgeInsets.only(bottom: smallSize),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(smallRadius),
              color: AppColors.borderColor),
          child:
              ClipRRect(
                  borderRadius: BorderRadius.circular(smallRadius),
                  child: imageWidget(picture, radius: standardRadius, fit: BoxFit.cover)),
        ),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Get.theme.textTheme.subtitle1
              ?.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget shoppingCenterWidget(
      String picture, String shoppingName, String rating, String subTitle) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.welfareCenterPageDetail),
      child: Container(
        width: fullWidth / 1.35,
        margin: EdgeInsets.only(bottom: smallSize),
        padding: EdgeInsetsDirectional.only(
            start: smallSize,
            end: smallSize,
            top: smallSize,
            bottom: standardSize,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(smallRadius),
            color: AppColors.formFieldColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: fullWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(smallRadius),
                  child: imageWidget(picture, radius: smallRadius,
                  ),
                ),
              ),
            ),
            SizedBox(height: xxSmallSize),
            Row(
              children: [
                Expanded(
                  child: Text(
                    shoppingName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Get.theme.textTheme.subtitle1
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  rating,
                  style: Get.theme.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: xxSmallSize/2),
                SvgPicture.asset('assets/icons/ic_star.svg')
              ],
            ),
            SizedBox(height: xxSmallSize),
            Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Get.theme.textTheme.bodyText1
                  ?.copyWith(color: AppColors.captionColor),
            )
          ],
        ),
      ),
    );
  }
}
