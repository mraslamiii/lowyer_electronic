import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/base/welfare_center_page/controller/welfare_center_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/image_widget.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  final WelfareCenterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var controller;
    return Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: controller.rpm.data?.categories.length,
              mainAxisExtent: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 2,
              childAspectRatio: 1/1),
          itemBuilder:(context, index) {
           return Container(
              margin: EdgeInsetsDirectional.only(
                end: standardSize,
                start: index == 0 ? standardSize : 0,
              ),
              child: categoryWidget(
                controller.rpm.data?.categories[index].image ??
                    '', //todo fix this images
                controller.rpm.data?.categories[index].title ?? '',
              ),
            );
          },
      ),
    //     Container(
    //   color: Colors.yellowAccent,
    //   width: fullWidth,
    //   height: fullHeight,
    // )

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
            color: AppColors.borderColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(smallRadius),
            child: imageWidget(
              picture,
              radius: standardRadius,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Get.theme.textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
