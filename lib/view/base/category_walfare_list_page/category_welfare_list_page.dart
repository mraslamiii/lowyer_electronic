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

import '../welfare_center_page/controller/welfare_center_controller.dart';
import 'category_welfare_center_controller.dart';

class CategoryWelfareListPage extends GetView<CategoryWelfareCenterController> {
  int id;
  WelfareCenterController centerController;
  final CategoryWelfareCenterController controller = Get.put(CategoryWelfareCenterController());

  CategoryWelfareListPage(this.id, this.centerController);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryWelfareCenterController>(
      initState: (state) {
        controller.getCategoryAcceptor(id);
      },
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
                          padding: EdgeInsets.symmetric(
                              vertical: mediumSize, horizontal: mediumSize),
                          child: AspectRatio(
                            aspectRatio: 16 / 10,
                            child: shoppingCenterWidget(
                                centerController,
                                index,
                                controller
                                        .rpm.data?.acceptors[index].headerPic ??
                                    '',
                                controller.rpm.data?.acceptors[index]
                                        .bussinesTitle ??
                                    '',
                                '4.8',
                                controller.rpm.data?.acceptors[index]
                                        .acceptorAbout ??
                                    ''),
                          ),
                        ),
                    childCount: controller.rpm.data?.acceptors.length))
          ],
        ),
      ),
    );
  }
}
