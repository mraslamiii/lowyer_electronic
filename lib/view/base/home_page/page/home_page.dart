import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/view/base/home_page/controller/home_controller.dart';
import 'package:kanoon_dadgostari/view/user/edit_profile_page/page/edit_profile_page.dart';
import 'package:kanoon_dadgostari/view/user/edit_social_info_page/binding/edit_social_info_binding.dart';
import 'package:kanoon_dadgostari/view/user/edit_social_info_page/page/edit_social_info_page.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_license_info_page/binding/lawyer_license_info_binding.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_skills_page/page/lawyer_skills_page.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_upload_image_page/page/lawyer_upload_image_page.dart';
import 'package:kanoon_dadgostari/view/user/lowyer_card_page/binding/lawyer_binding.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';

import '../../../../res/dimens/dimens.dart';
import '../../../user/edit_profile_page/binding/edit_profile_binding.dart';
import '../../../user/lawyer_license_info_page/page/lawyer_license_info_page.dart';
import '../../../user/lawyer_skills_page/binding/lawyer_skills_binding.dart';
import '../../../user/lowyer_card_page/page/lowyer_card_page.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../../widgets/progress_button/progress_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var theme = Get.theme;
  RxDouble sheetHeight = 0.79.obs;
  RxDouble sheetMinHeight = 0.79.obs;
  DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => customScaffold(
        // appBar: AppBar(
        //     toolbarHeight: 0,
        //     elevation: 0,
        //     backgroundColor: Colors.transparent,
        //     automaticallyImplyLeading: false),
        context: context,
        body: Stack(children: [
          Positioned(
              child: Image.asset('assets/images/pic_bg_home.jpg',
                  fit: BoxFit.fill, scale: 2.85)),
          Container(
            alignment: Alignment.center,
            height: fullWidth / 1.95,
            padding: EdgeInsets.only(
              right: standardSize,
              left: standardSize,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(standardRadius)),
            child: Center(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: fullWidth / 5.5,
                      height: fullWidth / 5.5,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () => homeSheet(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 3),
                                      color: const Color(0xff000000)
                                          .withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/avatar.JPG'),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.95, -1),
                            child: Container(
                              width: fullWidth / 18,
                              height: fullWidth / 18,
                              child: ElevatedButton(
                                onPressed: () {
                                  homeSheet(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: AppColors.splashColor,
                                    padding: EdgeInsets.all(xxSmallSize),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(standardRadius),
                                      side: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1.5),
                                    ),
                                    backgroundColor: Colors.white,
                                    elevation: 0),
                                child: SvgPicture.asset(
                                    'assets/icons/ic_edit_filled.svg',
                                    color: theme.primaryColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: xxSmallSize),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(child: titleWidget("حمیدرضا اسلمی")),
                                SvgPicture.asset(
                                    'assets/icons/ic_notification.svg')
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
          ),
          Obx(() {
            return DraggableScrollableSheet(
              minChildSize: sheetMinHeight.value,
              maxChildSize: 0.95,
              initialChildSize: sheetHeight.value,
              controller: draggableScrollableController,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return NotificationListener(
                  onNotification: (OverscrollIndicatorNotification overScroll) {
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(largeRadius),
                        topRight: Radius.circular(largeRadius),
                      ),
                      color: theme.backgroundColor,
                    ),
                    child:
                        // ListView(
                        //   physics: const BouncingScrollPhysics(),
                        //   children: [

                        Column(
                      children: [
                        Container(
                          width: xxLargeSize * 1.5,
                          height: xxSmallSize,
                          margin: EdgeInsets.only(
                            top: standardSize,
                            bottom: mediumSize,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(largeRadius),
                            color: theme.dividerColor,
                          ),
                        ),
                        Expanded(
                          child: GridView(
                            // shrinkWrap: true,
                            padding: EdgeInsets.only(top: mediumSize),
                            physics: const BouncingScrollPhysics(),
                            controller: scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1 / 1.1),
                            children: [
                              menuItemWidget(
                                  'assets/icons/ic_home_vakil_card.webp',
                                  'وکیل کارت',
                                  action: () => Get.toNamed(Routes.lawyerPage)),
                              menuItemWidget(
                                  'assets/icons/Ic_home_welfare_center.webp',
                                  'مرکز رفاهی',
                                  action: () =>
                                      Get.toNamed(Routes.welfareCenterPage)),
                              menuItemWidget(
                                  'assets/icons/Ic_home_edu_center.webp',
                                  'مرکز آموزش'),
                              menuItemWidget(
                                  'assets/icons/Ic_home_book_finder.webp',
                                  'دفتریاب'),
                              menuItemWidget(
                                  'assets/icons/Ic_search.webp', 'انتخابات'),
                              menuItemWidget('assets/icons/Ic_electronic.webp',
                                  'دولت الکترونیک'),
                              menuItemWidget(
                                  'assets/icons/Ic_home_court.webp', 'دادسرا'),
                              menuItemWidget(
                                  'assets/icons/Ic_home_add_person.webp',
                                  'جذب نیرو'),
                              menuItemWidget(
                                  'assets/icons/Ic_home_peyment.webp',
                                  'درگاه خدمات'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // ],
                    // ),
                  ),
                );
              },
            );
          })
        ]),
      ),
    );
  }

  Widget titleWidget(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: xxSmallSize / 2, horizontal: xxSmallSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: xxSmallSize),
            child: Icon(Icons.circle,
                color: Colors.white, size: xxSmallSize * 1.2),
          ),
          Expanded(
            child: Text("${title}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Get.theme.textTheme.subtitle2
                    ?.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget sheetItem(
      String title, String icon, bool isFirst, dynamic page, dynamic binding) {
    return GestureDetector(
      onTap: () {
        Get.to(page,
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 300),
            binding: binding);
      },
      // splashColor: AppColors.splashColor,
      child: Column(
        children: [
          if (!isFirst)
            Divider(
              color: AppColors.dividerColor,
              height: 0.8,
            ),
          Container(
            padding: EdgeInsets.only(top: standardSize, bottom: standardSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: smallSize),
                  child: SvgPicture.asset(icon),
                ),
                Expanded(
                  child: Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Get.theme.textTheme.subtitle2),
                ),
              ],
            ),
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
            padding: EdgeInsets.all(standardSize * 1.3),
            margin: EdgeInsets.only(bottom: smallSize),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(standardRadius),
                color: AppColors.formFieldColor),
            child: Image.asset(icon),
          ),
          Text(
            title,
            style: Get.theme.textTheme.subtitle2,
          )
        ],
      ),
    );
  }

  void homeSheet(BuildContext context) {
    customBottomSheet(
      context,
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ListView(
            padding: EdgeInsetsDirectional.only(
              top: standardSize,
            ),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              sheetItem('اطلاعات پروفایل', 'assets/icons/ic_profile_info.svg',
                  true, EditProfilePage(), EditProfileBinding()),
              sheetItem('اطلاعات دفتر وکالت', 'assets/icons/ic_law_office.svg',
                  false, LawyerLicenseInfoPage(), LawyerLicenseInfoBinding()),
              sheetItem('اطلاعات فضای مجازی', 'assets/icons/ic_social_info.svg',
                  false, const EditSocialInfoPage(), EditSocialInfoBinding()),
              sheetItem('کیف پول', 'assets/icons/ic_wallet.svg', false,
                  const LawyerCardPage(), LawyerBinding()),
              sheetItem('مهارت ها', 'assets/icons/ic_skills.svg', false,
                  const LawyerSkillsPage(), LawyerSkillsBinding()),
              sheetItem('آموزش ها', 'assets/icons/ic_trainings.svg', false,
                  null, null),
            ]),
      ),
    );
  }
}
