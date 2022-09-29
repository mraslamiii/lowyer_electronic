import 'package:flutter/cupertino.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';

import '../res/dimens/dimens.dart';
import '../view/widgets/image_widget.dart';

Widget avatarImageCircle(String image){
  return    Container(
    width: fullWidth / 5.5,
    height: fullWidth / 5.5,
    decoration: BoxDecoration(
      color: AppColors.factorCardColor,
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowColor,
          offset: Offset(0, 4),
          blurRadius: 5,
          spreadRadius: 0.5
        )
      ],
      shape: BoxShape.circle
    ),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(xxLargeSize * 100),
        child: image.startsWith("assets") ? Image.asset(image,fit: BoxFit.cover,width: fullWidth / 9,
          height: fullWidth / 9) : imageWidget(image
          // "https://s6.uupload.ir/files/hotel_dwup.jpg"

        )),
  );
  }