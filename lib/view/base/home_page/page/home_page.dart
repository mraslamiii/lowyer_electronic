// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/view/base/home_page/controller/home_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import '../../../../res/dimens/dimens.dart';
import '../../../../service/preferences_service.dart';
import '../../../widgets/custom_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var theme = Get.theme;
  RxDouble sheetHeight = 0.79.obs;
  RxDouble sheetMinHeight = 0.79.obs;
  DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  final HomeController controller = Get.put(HomeController());
  final LocalStorageService pref = Get.find<LocalStorageService>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      initState: (state) {
        if (controller.pref.lawyer.user!.lawyerProfile == null) {
          controller.fetchHomeData();
        }
      },
      builder: (controller) => customScaffold(
        // appBar: AppBar(
        //     toolbarHeight: 0,
        //     elevation: 0,
        //     backgroundColor: Colors.transparent,
        //     automaticallyImplyLeading: false),
        context: context,
        body: Stack(
          children: [
            // Positioned(
            //   child: Image.asset(
            //     'assets/images/pic_bg_home.jpg',
            //     fit: BoxFit.fill,
            //     scale: 2.4,
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              height: fullWidth / 1.95,
              padding: EdgeInsets.only(
                right: standardSize,
                left: standardSize,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pic_bg_home.jpg"),
                  fit: BoxFit.fill,
                  scale: 2.4,
                ),
              ),
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
                                      color:
                                          const Color(0xff000000).withOpacity(
                                        0.2,
                                      ),
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/avatar.JPG',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.95, -1),
                            child: SizedBox(
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
                                    borderRadius: BorderRadius.circular(
                                      standardRadius,
                                    ),
                                    side: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/ic_edit_filled.svg',
                                  color: theme.primaryColor,
                                ),
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
                                Flexible(
                                  child: titleWidget(
                                    '${pref.user.firstName} ${pref.user.lastName}',
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/ic_notification.svg',
                                )
                              ],
                            ),
                            titleWidget(pref.lawyer.user?.code.isEmpty ?? false
                                ? 'فعالیت شما تایید نشده است'
                                : 'کد فعالیت :${pref.lawyer.user!.code}'),
                            titleWidget(
                                "شهر محل فعالیت : ${pref.lawyer.profile!.cityName}"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(largeRadius),
                  topRight: Radius.circular(largeRadius),
                ),
                color: theme.backgroundColor,
              ),
              margin: EdgeInsets.only(top: fullHeight / 4),
              child:
                  // ListView(
                  //   physics: const BouncingScrollPhysics(),
                  //   children: [

                  GridView(
                // shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: standardSize,
                  left: standardSize,
                  right: standardSize,
                ),
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: standardSize,
                  mainAxisSpacing: xSmallSize,
                  childAspectRatio: 1 / 1.35,
                ),
                children: [
                  menuItemWidget(
                    'assets/icons/ic_home_vakil_card.png',
                    'وکیل کارت',
                    action: () => Get.toNamed(Routes.lawyerPage),
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_welfare_center.webp',
                    'مرکز رفاهی',
                    action: () => Get.toNamed(Routes.welfareCenterPage),
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_edu_center.webp',
                    'مرکز آموزش',
                    disabled: true,
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_book_finder.webp',
                    'دفتریاب',
                    disabled: true,
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_search.webp',
                    'انتخابات',
                    disabled: true,
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_electronic.webp',
                    'دولت الکترونیک',
                    disabled: true,
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_court.webp',
                    'دادسرا',
                    disabled: true,
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_add_person.webp',
                    'جذب نیرو',
                    disabled: true,
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_peyment.webp',
                    'درگاه خدمات',
                    disabled: true,
                  ),
                ],
              ),
              // ],
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleWidget(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: xxSmallSize / 2,
        horizontal: xxSmallSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: xxSmallSize),
            child: Icon(
              Icons.circle,
              color: Colors.white,
              size: xxSmallSize * 1.2,
            ),
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Get.theme.textTheme.subtitle2?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sheetItem(
    BuildContext context,
    String title,
    String icon,
    bool isFirst,
    String? routeName,
  ) {
    return Ink(
      color: Colors.black54,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Get.toNamed(routeName!);
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
    );
  }

  Widget menuItemWidget(
    String icon,
    String title, {
    GestureTapCallback? action,
    bool disabled = false,
  }) {
    return GestureDetector(
      onTap: action,
      child: Column(
        children: [
          Opacity(
            opacity: disabled ? 0.5 : 1,
            child: Container(
              width: fullWidth / 4,
              height: fullWidth / 4,
              padding: EdgeInsets.all(standardSize * 1.3),
              margin: EdgeInsets.only(bottom: smallSize),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(standardRadius),
                color: AppColors.formFieldColor,
              ),
              child: Image.asset(icon),
            ),
          ),
          Opacity(
            opacity: disabled ? 0.4 : 1,
            child: Text(
              title,
              style: Get.theme.textTheme.subtitle2,
            ),
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
          padding: EdgeInsetsDirectional.only(bottom: fullHeight / 18),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            sheetItem(
              context,
              'اطلاعات پروفایل',
              'assets/icons/ic_profile_info.svg',
              true,
              Routes.editProfile,
            ),
            sheetItem(
              context,
              'اطلاعات پروانه وکالت',
              'assets/icons/ic_law_office.svg',
              false,
              Routes.lawyerLicenseInfoPage,
            ),
            sheetItem(
              context,
              'اطلاعات فضای مجازی',
              'assets/icons/ic_social_info.svg',
              false,
              Routes.editSocialInfoPage,
            ),
            sheetItem(
              context,
              'کیف پول',
              'assets/icons/ic_wallet.svg',
              false,
              null,
            ),
            // sheetItem('مهارت ها', 'assets/icons/ic_skills.svg', false,
            //     const LawyerSkillsPage()),
            // sheetItem('آموزش ها', 'assets/icons/ic_trainings.svg', false,
            //     null),
          ],
        ),
      ),
    );
  }
}
