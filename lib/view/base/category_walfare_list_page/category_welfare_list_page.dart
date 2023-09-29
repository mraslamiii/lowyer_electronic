// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/base/welfare_center_page/page/welfare_center_page.dart';
import '../../../../res/dimens/dimens.dart';
import '../welfare_center_page/controller/welfare_center_controller.dart';
import 'category_welfare_center_controller.dart';

class CategoryWelfareListPage extends GetView<CategoryWelfareCenterController> {

  int id;
  WelfareCenterController centerController;

  @override
  final CategoryWelfareCenterController controller = Get.put(CategoryWelfareCenterController());

  CategoryWelfareListPage(this.id, this.centerController, {super.key});

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
              title:const Text("دسته بندی ها"),
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon:const Icon(
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
                                        .rpm?.data[index].headerPic ??
                                    '',
                                controller.rpm?.data[index]
                                        .bussinesTitle ??
                                    '',
                                '4.8',
                                controller.rpm?.data[index]
                                        .acceptorAbout ??
                                    ''),
                          ),
                        ),
                    childCount: controller.rpm?.data.length))
          ],
        ),
      ),
    );
  }
}
