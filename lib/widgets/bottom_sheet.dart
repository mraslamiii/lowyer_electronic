import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/auth/login_page/page/login_page.dart';
import 'package:kanoon_dadgostari/view/base/home_page/controller/home_controller.dart';

import '../res/colors/colors.dart';
import '../res/dimens/dimens.dart';
import '../service/preferences_service.dart';



void profileExitSheet(BuildContext context,
    {String? optionalText, bool? isShowIcon,
      VoidCallback? optionalCallBack
    }) {
  final LocalStorageService pref = Get.find<LocalStorageService>();
  final HomeController controller = Get.find();
  var theme = Theme.of(context);
  showModalBottomSheet(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(largeSize),
          topLeft: Radius.circular(largeSize),
        ),
      ),
      // shape:ShapeBorderClipper(shape: ShapeBorder.lerp(a, b, t)) ,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(largeSize),
                topLeft: Radius.circular(largeSize),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff10548B).withOpacity(0.16),
                  spreadRadius: 10,
                  blurRadius: 10,
                  // blurStyle: BlurStyle.solid
                )
              ]),
          padding: EdgeInsets.symmetric(vertical: largeSize),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isShowIcon == true
                  ? const SizedBox()
                  : Container(
                margin: EdgeInsetsDirectional.only(top: smallSize),
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/icons/ic_logout.svg",
                    width: 50.w, height: 50.w,
                color:  const Color(0xffef5350),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                    top: largeSize, bottom: largeSize),
                child: Text(
                  optionalText ?? 'out'.tr,
                  style: theme.textTheme.subtitle1!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  margin: EdgeInsetsDirectional.only(start: standardSize),
                  width: fullWidth / 2.4,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding:
                        EdgeInsets.symmetric(vertical: fullWidth / 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(mediumRadius),
                            side:  const BorderSide(
                                width: 1, color: AppColors.errorColor))),
                    onPressed: optionalCallBack ??() {
                      controller.logOut();
                    },
                    child: Text('بله',
                        style: theme.textTheme.subtitle2?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.errorColor)),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(end: standardSize),
                  width: fullWidth / 2.4,
                  // margin: EdgeInsetsDirectional.only(start: xSmallSize),
                  child: TextButton(

                    style: TextButton.styleFrom(


                        padding:
                        EdgeInsets.symmetric(vertical: fullWidth / 25),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(mediumRadius),
                            side: BorderSide.none)),

                    onPressed: () {
                      Get.back();
                    },


                    child: Text('خیر',
                        style: theme.textTheme.subtitle2?.copyWith(
                            fontWeight: FontWeight.w600,
                            color:Colors.black)),
                  ),
                ),
              ]),
            ],
          ),
        );
      });
}
