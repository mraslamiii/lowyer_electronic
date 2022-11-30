import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanoon_dadgostari/view/base/basket_controller/basket_controller.dart';
import 'package:kanoon_dadgostari/view/base/welfare_center_detail_page/controller/welfare_center_detail_controller.dart';
import 'package:kanoon_dadgostari/view/base/welfare_center_page/page/welfare_center_page.dart';
import 'package:readmore/readmore.dart';

import '../../../../models/category_model/detail_category_model.dart';
import '../../../../models/entity/basket/service_entity.dart';
import '../../../../res/colors/colors.dart';
import '../../../../res/dimens/dimens.dart';
import '../../../../utilites/hive_utils/hive_utils.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../../widgets/image_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../checkout_page/page/checkout_page.dart';
import '../controller/welfare_center_controller.dart';

class WelfareListPage extends GetView<WelfareCenterController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("دسته بندی ها"),
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  )),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding:  EdgeInsets.symmetric(vertical: mediumSize,horizontal: mediumSize),
                      child: AspectRatio(
                        aspectRatio: 16/10,
                        child: shoppingCenterWidget(
                            controller,
                            index,
                            controller.rpm.data?.acceptors[index].headerPic ?? '',
                            controller.rpm.data?.acceptors[index].bussinesTitle ??
                                '',
                            '4.8',
                            controller.rpm.data?.acceptors[index].acceptorAbout ??
                                ''),
                      ),
                    ),
                    childCount: controller.rpm.data?.acceptors.length)
            )
          ],
        ),
      ),
    );
  }
}
