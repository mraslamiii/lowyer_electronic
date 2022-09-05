import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/view/Intro/splash_page/controller/splash_controller.dart';
import 'package:kanoon_dadgostari/view/base/home_page/controller/home_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../res/dimens/dimens.dart';
import '../../../auth/login_page/page/login_page.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/image_widget.dart';
import '../controller/welfare_center_controller.dart';

class WelfareCenterPage extends StatelessWidget {
  WelfareCenterPage({Key? key}) : super(key: key);

  // List<String> shoppingImages = [
  //   'https://images.adsttc.com/media/images/5e13/e676/3312/fdf5/c900/014c/medium_jpg/01.jpg?1578362478',
  //   // 'https://cdn.wallpaper.com/main/styles/fp_922x565/s3/facade_of_k11_musea_1.jpg',
  // ];
  List<String> images = [
    'https://m3.healio.com/~/media/slack-news/stock-images/fm_im/u/ultraprocessed-foods.jpg',
    'https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq',
    'https://i.guim.co.uk/img/media/20491572b80293361199ca2fc95e49dfd85e1f42/0_236_5157_3094/master/5157.jpg?width=1200&quality=85&auto=format&fit=max&s=6c20695f8d0e980ee80d47265efee6c5'
  ];
  List<String> titles = ['مراکز خـرید', 'پوشـاک', 'دارو'];

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
                onPressed: () {},
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
                itemCount: titles.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsetsDirectional.only(
                          end: standardSize,
                          start: index == 0 ? standardSize : 0),
                      child: categoryWidget(images[index], titles[index]));
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
            height: fullWidth / 1.9,
            width: fullWidth,
            child:
                //   Padding(
                //     padding: EdgeInsetsDirectional.only(
                //         top: mediumSize,
                //         bottom: mediumSize),
                //     child:
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
                        'https://m3.healio.com/~/media/slack-news/stock-images/fm_im/u/ultraprocessed-foods.jpg',
                        'مرکز خرید پروما',
                        '4.8',
                        'لورم ایپسوم لورم ایپسوم لورم ایپسوم'));
              },
            ),
          ),
          // ),
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
              borderRadius: BorderRadius.circular(standardRadius),
              color: AppColors.borderColor),
          child:
              imageWidget(picture, radius: standardRadius, fit: BoxFit.cover),
        ),
        Text(
          title,
          style: Get.theme.textTheme.subtitle1
              ?.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget shoppingCenterWidget(
      String picture, String shoppingName, String rating, String subTitle) {
    return Container(
      width: fullWidth / 1.5,
      height: fullWidth / 3,
      margin: EdgeInsets.only(bottom: smallSize),
      padding: EdgeInsets.all(smallSize),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(standardRadius),
          color: AppColors.formFieldColor),
      child: Column(
        children: [
          Expanded(
            child: imageWidget(picture, radius: standardRadius,
              // width: fullWidth / 1.5,
              // height: fullWidth / 4,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  shoppingName,
                  style: Get.theme.textTheme.subtitle2
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                rating,
                style: Get.theme.textTheme.subtitle1
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              SvgPicture.asset('assets/icons/ic_star.svg')
            ],
          ),
          Text(
            subTitle,
            style: Get.theme.textTheme.bodyText1
                ?.copyWith(color: AppColors.captionColor),
          )
        ],
      ),
    );
  }
}
