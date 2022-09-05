import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../controller/history_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "تاریخچه",
            ),
            automaticallyImplyLeading: false,
            leading: backIcon(),
          ),
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: standardSize,left: standardSize,right: standardSize),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => _historyCard(),
          )),
    );
  }
}

Widget _historyCard() {
  return Container(
    margin: EdgeInsets.only(bottom: standardSize),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(xSmallRadius),
        color: AppColors.formFieldColor),
    padding: EdgeInsets.symmetric(horizontal: smallSize),
    child: Column(
      children: [
        _historyWidgetItem(
            'assets/icons/Paper.svg', "نوع درخواست", "صدور کارت جدید"),
        const Divider(),
        _historyWidgetItem(
            'assets/icons/stickynote.svg', " تاریخ", "28/8/1401"),
        const Divider(),
        _historyWidgetItem(
            'assets/icons/clipboard-tick.svg', "وضعیت", "در حال بررسی"),
      ],
    ),
  );
}

Widget _historyWidgetItem(String icon, String title, String subTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          SvgPicture.asset(icon),
          Padding(
            padding: EdgeInsets.only(right: smallSize,top: smallSize,bottom: smallSize),
            child: Text("$title :",
                style: Get.theme.textTheme.subtitle2
                !.copyWith(color: AppColors.primaryColor)),
          ),
        ],
      ),
      SizedBox(width: xSmallSize),
      Flexible(child: Text(subTitle, style: Get.theme.textTheme.subtitle2,maxLines: 1,overflow: TextOverflow.ellipsis,)),
    ],
  );
}
