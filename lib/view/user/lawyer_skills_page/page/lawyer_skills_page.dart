import 'package:flutter/material.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../controller/lawyer_skills_controller.dart';

class LawyerSkillsPage extends StatelessWidget {
  const LawyerSkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LawyerSkillsController>(
      init: LawyerSkillsController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "مهارت های وکیل",
            ),
            automaticallyImplyLeading: false,
            leading: backIcon(),
          ),
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: standardSize,left: standardSize,right: standardSize),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => _lawyerSkillsCard(),
          )),
    );
  }
  Widget _lawyerSkillsCard() {
    return Container(
      margin: EdgeInsets.only(bottom: standardSize),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(xSmallRadius),
          color: AppColors.formFieldColor),
      padding: EdgeInsets.symmetric(horizontal: smallSize),
      child: Column(
        children: [
          _lawyerSkillsWidgetItem(
              'assets/icons/clipboard-tick.svg', "مهـارت قضـاوت", "نـام مهـارت"),
          const Divider(),
          _lawyerSkillsWidgetItem(
              'assets/icons/Paper.svg', "تــوضیحــات مهـارت", "وکیل حرفه ای باید بتواند از اینکه پرونده قضاوت شود خود قضاوت کند. بتواند مانند یک قاضی به پرونده نگاه کند"),

        ],
      ),
    );
  }

  Widget _lawyerSkillsWidgetItem(String icon, String title, String subTitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(icon),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: '$title : ',
              style: Get.theme.textTheme.subtitle2
              !.copyWith(color: AppColors.primaryColor),
              children: <TextSpan>[
                TextSpan(
                    text: subTitle,
                    style: Get.theme.textTheme.subtitle2
                ),
              ],
            ),
          ),
        ),
        // Row(
        //   children: [
        //     SvgPicture.asset(icon),
        //     RichText(
        //       text: TextSpan(
        //         text: '$title :',
        //         style: Get.theme.textTheme.subtitle2
        //         !.copyWith(color: AppColors.primaryColor),
        //         children: <TextSpan>[
        //           TextSpan(
        //               text: subTitle,
        //           style: Get.theme.textTheme.subtitle2
        //           ),
        //         ],
        //       ),
        //     ),
        //     // Padding(
        //     //   padding: EdgeInsets.only(right: smallSize),
        //     //   child: Text("$title :",
        //     //       style: Get.theme.textTheme.subtitle2
        //     //       !.copyWith(color: AppColors.primaryColor)),
        //     // ),
        //   ],
        // ),
        // SizedBox(width: xxSmallSize),
        // Flexible(child: Text(subTitle, style: Get.theme.textTheme.subtitle2),fit: FlexFit.loose),
      ],
    );
  }
}
