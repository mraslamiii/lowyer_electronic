import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/view/Intro/splash_page/controller/splash_controller.dart';
import 'package:kanoon_dadgostari/view/base/home_page/controller/home_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../res/dimens/dimens.dart';
import '../../../auth/login_page/page/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => customScaffold(
        appBar: AppBar(toolbarHeight: 0,elevation: 0,backgroundColor: Colors.transparent,automaticallyImplyLeading: false),
        context: context,
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(top: largeSize,left: standardSize,right: standardSize),
            padding: EdgeInsets.symmetric(
                horizontal: mediumSize, vertical: mediumSize),
            decoration: BoxDecoration(
                color: AppColors.formFieldColor,
                borderRadius: BorderRadius.circular(standardRadius)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: fullWidth / 4.8,
                    height: fullWidth / 4.8,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.JPG'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: xxSmallSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(child: titleWidget("حمیدرضا اسلمی")),
                              Icon(Icons.notifications_none_outlined)
                            ],
                          ),
                          titleWidget("شماره فعالیت : 31553231"),
                          titleWidget("شهر محل فعالیت : مشهد"),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mediumSize, horizontal: smallSize),
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1 / 1.1),
                children: [
                  menuItemWidget('assets/icons/ic_home_vakil_card.webp', 'وکیل کارت',
                      action: () => Get.toNamed(Routes.lawyerPage)),
                  menuItemWidget('assets/icons/Ic_home_welfare_center.webp', 'مرکز رفاهی',action: () => Get.toNamed(Routes.welfareCenterPage)),
                  menuItemWidget('assets/icons/Ic_home_edu_center.webp', 'مرکز آموزش'),
                  menuItemWidget('assets/icons/Ic_home_book_finder.webp', 'دفتریاب'),
                  menuItemWidget('assets/icons/Ic_search.webp', 'انتخابات'),
                  menuItemWidget(
                      'assets/icons/Ic_electronic.webp', 'دولت الکترونیک'),
                  menuItemWidget('assets/icons/Ic_home_court.webp', 'دادسرا'),
                  menuItemWidget('assets/icons/Ic_home_add_person.webp', 'جذب نیرو'),
                  menuItemWidget('assets/icons/Ic_home_peyment.webp', 'درگاه خدمات'),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget titleWidget(String title) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: xxSmallSize, horizontal: xxSmallSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: xxSmallSize),
            child: Icon(Icons.circle,
                color: Colors.black, size: xxSmallSize * 1.2),
          ),
          Expanded(
            child: Text("${title}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Get.theme.textTheme.subtitle2),
          ),
        ],
      ),
    );
  }

  Widget menuItemWidget(String icon, String title,
      {GestureTapCallback? action}) {
    return GestureDetector(
      onTap: action,
      child: Column(
        children: [
          Container(
            width: fullWidth / 4.5,
            height: fullWidth / 4.5,
            margin: EdgeInsets.only(bottom: smallSize),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(standardRadius),
                color: AppColors.formFieldColor),
            child: Image.asset(icon,height: 0,width: 0,fit: BoxFit.cover,scale: 10,),
          ),
          Text(
            title,
            style: Get.theme.textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
