// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kanoon_dadgostari/widgets/bottom_sheet.dart';
import 'package:toast/toast.dart';
import '../../../../app/app_pages.dart';
import '../../../../res/colors/colors.dart';
import '../../../../res/dimens/dimens.dart';
import '../../../../service/preferences_service.dart';
import '../../../widgets/customScaffold/customScaffold.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../../widgets/image_widget.dart';
import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var theme = Get.theme;
  final LocalStorageService pref = Get.find<LocalStorageService>();
  final HomeController controller = Get.put(HomeController());

  void showToast({String? msg, int? duration, int? gravity}) {
    Toast.show('به زودی فعال میشود', duration: 2, gravity: Toast.bottom);
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    debugPrint('token:${pref.token}');

    return GetBuilder<HomeController>(
      init: controller,
      initState: (state) {
        if (pref.isFirstTimeLaunch) {
          controller.fetchHomeData();
          pref.isFirstTimeLaunch = false;
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
              height: fullWidth / 1.6,
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
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    right: xSmallSize,
                    top: xxLargeSize/1.2,
                    left: xSmallSize,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              homeSheet(context);
                            },
                            child: Icon(Icons.more_vert_sharp,color: Colors.white,)),
                        SvgPicture.asset(
                          'assets/icons/ic_notification.svg',
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: fullWidth / 5.5,
                        height: fullWidth / 5.5,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child:GestureDetector(
                                  onTap: () {
                                    customBottomSheet(
                                      Get.context!,
                                      Column(
                                        children: [
                                          // Text(
                                          //   '',
                                          //   style: theme.textTheme.bodyText1?.copyWith(
                                          //     fontWeight: FontWeight.w600,
                                          //   ),
                                          // ),
                                          SizedBox(height: smallSize),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  splashColor: AppColors.splashColor,
                                                  borderRadius:
                                                  BorderRadius.circular(xSmallRadius),
                                                  onTap: () {
                                                    controller.openGallery();
                                                    controller.update();
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.only(
                                                      start: xxLargeSize,
                                                      end: xxLargeSize,
                                                      top: standardSize,
                                                      bottom: standardSize,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color: const Color(0xFFEAEBF9),
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                              xSmallRadius,
                                                            ),
                                                          ),
                                                          padding: EdgeInsetsDirectional.all(
                                                              standardSize),
                                                          child: SvgPicture.asset(
                                                            "assets/icons/ic_gallery.svg",
                                                            color: theme.primaryColor,
                                                            width: iconSizeMedium,
                                                            height: iconSizeMedium,
                                                          ),
                                                        ),
                                                        SizedBox(height: smallSize),
                                                        const Text('گالری'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsetsDirectional.only(
                                        bottom: standardSize,
                                      ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(xxLargeSize*100),
                                    child:
                                    // Image.file(controller.file.value)
                                    imageWidget(
                                        controller.res ?? ''
                                    ),
                                  )
/*
                                Container(
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
                                  child: Container(
                                    child: Image.file(
                                      // controller.file.value.path.isNotEmpty ?
                                      controller.file.value,
                                          fit: BoxFit.contain
                                          // 'assets/images/avatar.JPG'
                                      ,
                                    ),
                                  ),
                                ),
*/
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-0.95, -1),
                              child: SizedBox(
                                width: fullWidth / 18,
                                height: fullWidth / 18,
                                child: ElevatedButton(
                                  onPressed: () {
                                    customBottomSheet(
                                      Get.context!,
                                      Column(
                                        children: [
                                          // Text(
                                          //   '',
                                          //   style: theme.textTheme.bodyText1?.copyWith(
                                          //     fontWeight: FontWeight.w600,
                                          //   ),
                                          // ),
                                          SizedBox(height: smallSize),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  splashColor: AppColors.splashColor,
                                                  borderRadius:
                                                  BorderRadius.circular(xSmallRadius),
                                                  onTap: () {
                                                    controller.openGallery();
                                                    controller.update();
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.only(
                                                      start: xxLargeSize,
                                                      end: xxLargeSize,
                                                      top: standardSize,
                                                      bottom: standardSize,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color: const Color(0xFFEAEBF9),
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                              xSmallRadius,
                                                            ),
                                                          ),
                                                          padding: EdgeInsetsDirectional.all(
                                                              standardSize),
                                                          child: SvgPicture.asset(
                                                            "assets/icons/ic_gallery.svg",
                                                            color: theme.primaryColor,
                                                            width: iconSizeMedium,
                                                            height: iconSizeMedium,
                                                          ),
                                                        ),
                                                        SizedBox(height: smallSize),
                                                        Text("gallery".tr),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsetsDirectional.only(
                                        bottom: standardSize,
                                      ),
                                    );
                                    // sheetPickImage();
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
                              Flexible(
                                child: titleWidget(
                                  '${controller.pref.user.firstName} ${controller.pref.user.lastName}',
                                ),
                              ),
                              titleWidget(controller
                                          .pref.lawyer.user?.code.isEmpty ??
                                      false
                                  ? 'فعالیت شما تایید نشده است'
                                  : 'کد فعالیت :${controller.pref.lawyer.user!.code}'),
                              titleWidget(controller.pref.lawyer.profile?.cityName.isEmpty ??
                                  false
                                  ? 'شهری انتخاب نشده است'
                                  : "شهر محل فعالیت : ${controller.pref.lawyer.profile?.cityName}"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
                    // action: () {
                    //
                    //
                    //   // controller.openGallery();
                    // },
                    action: () => showToast(),
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_book_finder.webp',
                    'دفتریاب',
                    disabled: true,
                    action: () => showToast(),
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_search.webp',
                    'انتخابات',
                    disabled: true,
                    action: () => showToast(),
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_electronic.webp',
                    'دولت الکترونیک',
                    disabled: true,
                    action: () => showToast(),
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_court.webp',
                    'دادسرا',
                    disabled: true,
                    action: () => showToast(),
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_add_person.webp',
                    'جذب نیرو',
                    disabled: true,
                    action: () => showToast(),
                  ),
                  menuItemWidget(
                    'assets/icons/Ic_home_peyment.webp',
                    'درگاه خدمات',
                    disabled: true,
                    action: () => showToast(),
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
    String? routeName, {
    double? width,
    double? height,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    return Ink(
      color: Colors.black54,
      child: InkWell(
        onTap: onTap ??
            () {
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
                    child: SvgPicture.asset(
                      icon,
                      width: width,
                      height: height,
                      color: iconColor,
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
            sheetItem(
              context,
              'خروج',
              'assets/icons/ic_logout.svg',
              false,
              null,
              width: iconSizeMedium,
              height: iconSizeMedium,
              iconColor: const Color(0xffef5350),
              onTap: () {
                profileExitSheet(context,
                    optionalText: 'آیا میخواهید خارج شوید ؟');
              },
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
  void sheetPickImage(){
     customBottomSheet(
      Get.context!,
      Column(
        children: [
          // Text(
          //   '',
          //   style: theme.textTheme.bodyText1?.copyWith(
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          SizedBox(height: smallSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: AppColors.splashColor,
                  borderRadius:
                  BorderRadius.circular(xSmallRadius),
                  onTap: () {
                    controller.openCamera();
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: xxLargeSize,
                      end: xxLargeSize,
                      top: standardSize,
                      bottom: standardSize,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAEBF9),
                            borderRadius:
                            BorderRadius.circular(
                                xSmallRadius),
                          ),
                          padding: EdgeInsetsDirectional.all(
                            standardSize,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/ic_camera.svg",
                            color: theme.primaryColor,
                            width: iconSizeMedium,
                            height: iconSizeMedium,
                          ),
                        ),
                        SizedBox(height: smallSize),
                        Text("camera".tr),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: standardSize),
              Container(
                height: xxLargeSize * 1.2,
                width: 1,
                color: AppColors.borderColor,
              ),
              SizedBox(width: standardSize),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: AppColors.splashColor,
                  borderRadius:
                  BorderRadius.circular(xSmallRadius),
                  onTap: () {
                    controller.openGallery();
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: xxLargeSize,
                      end: xxLargeSize,
                      top: standardSize,
                      bottom: standardSize,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAEBF9),
                            borderRadius:
                            BorderRadius.circular(
                              xSmallRadius,
                            ),
                          ),
                          padding: EdgeInsetsDirectional.all(
                              standardSize),
                          child: SvgPicture.asset(
                            "assets/icons/ic_gallery.svg",
                            color: theme.primaryColor,
                            width: iconSizeMedium,
                            height: iconSizeMedium,
                          ),
                        ),
                        SizedBox(height: smallSize),
                        Text("gallery".tr),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      padding: EdgeInsetsDirectional.only(
        bottom: standardSize,
      ),
    );
  }
}
