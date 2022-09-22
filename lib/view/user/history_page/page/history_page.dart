import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/utilites/datetime_extentions.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../../enums/request_type_enum.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../controller/history_controller.dart';

class HistoryPage extends StatelessWidget {
   HistoryPage({Key? key}) : super(key: key);
  final HistoryController controller = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    // var card = controller.pref.lawyer.cards;

    return GetBuilder<HistoryController>(
      init: controller,
      initState: (state) => controller.fetchCardHistory(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "تاریخچه",
            ),
            automaticallyImplyLeading: false,
            leading: backIcon(),
          ),
          body: controller.obx((state) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: standardSize,left: standardSize,right: standardSize),
            shrinkWrap: true,
            itemCount: controller.rpm.length,
            itemBuilder: (context, index) => _historyCard(index),
          ),onLoading: const Center(child: CupertinoActivityIndicator(),)),
    ),);
  }
  Widget _historyCard(int index) {

    return Container(
      margin: EdgeInsets.only(bottom: standardSize),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(xSmallRadius),
          color: AppColors.formFieldColor),
      padding: EdgeInsets.symmetric(horizontal: smallSize),
      child: Column(
        children: [
          _historyWidgetItem(
              'assets/icons/ic_paper.svg',
              "نوع درخواست",
              RequestType.making.name == controller.rpm[index].requestType
                  ? 'درحال ساخت'
                  : controller.rpm[index].requestType == RequestType.active.name
                  ? 'فعال' :
                  'مسدود شده'
          ),
          const Divider(),
          _historyWidgetItem(
              'assets/icons/stickynote.svg', " تاریخ", getDate(DateTime.parse(controller.rpm[index].createdAt).toJalali())),
          const Divider(),
          _historyWidgetItem(
              'assets/icons/clipboard_tick.svg',
              "وضعیت",
              controller.rpm[index].status == StatusType.pending.name
                  ? 'در حال بررسی'
                  : controller.rpm[index].status == StatusType.accept.name
                  ? 'تایید شده'
                  : 'رد شده'),
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
        SizedBox(width: xxSmallSize),
        Flexible(child: Text(subTitle, style: Get.theme.textTheme.subtitle2,maxLines: 1,overflow: TextOverflow.ellipsis,)),
      ],
    );
  }
}

