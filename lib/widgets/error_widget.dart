import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';

Widget errorWidget({VoidCallback? onTap,RxBool? isBusy}){
  final theme = Get.theme;

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('خطا در برقراری ارتباط',
        style: theme.textTheme.subtitle2,),
        SizedBox(height: smallSize,),
        Obx(()=>progressButton(onTap: onTap, text: 'تلاش مجدد',
        isProgress: isBusy?.value ?? false
        ))
      ],
    ),
  );
}