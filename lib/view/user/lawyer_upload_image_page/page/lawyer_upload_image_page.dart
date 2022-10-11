import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/upload_image_box_widget.dart';
import '../binding/lawyer_upload_image_binding.dart';
import '../controller/lawyer_upload_image_controller.dart';

class LawyerUploadImagePage extends GetView<LawyerUploadImageController> {
  LawyerUploadImagePage({Key? key}) : super(key: key);

  var theme = Get.theme;

  @override
  Widget build(BuildContext context) {
    LawyerUploadImageBinding().dependencies();
    return GetBuilder(
        init: controller,
        initState: (state) {
          controller.update();
          // print();
        },
        builder: (_) {
          return customScaffold(
            bottomAppBar: BottomAppBar(
                elevation: 0,
                child: Container(
                  margin: EdgeInsets.all(standardSize),
                  child: SizedBox(
                    width: fullWidth,
                    child: progressButton(onTap: () {}, text: "ثبت اطلاعات"),
                  ),
                )),
            appBar: AppBar(
              title: const Text(
                "ویـرایش پروفایل",
              ),
              leading: backIcon(),
            ),
            body:
                // Obx(() {
                //             return
                ListView(
              padding: EdgeInsets.symmetric(horizontal: standardSize),
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                uploadImageBoxWidget(
                  boxFit: BoxFit.fitWidth,
                  title: 'تصویر پروانه وکالت',
                  onTap: () {
                    controller.openGallery(controller.lawyerFile);
                  },
                  file: controller.lawyerFile,
                ),
                uploadImageBoxWidget(
                  boxFit: BoxFit.fitWidth,
                  title: 'تصویر شناسنامه',
                  onTap: () {
                    controller.openGallery(controller.identityFile);
                  },
                  file: controller.identityFile,
                ),
                uploadImageBoxWidget(
                  boxFit: BoxFit.fitWidth,
                  title: 'تصویر جلو کارت ملی',
                  onTap: () {
                    controller.openGallery(controller.frontNationalCardFile);
                  },
                  file: controller.frontNationalCardFile,
                ),
                uploadImageBoxWidget(
                  boxFit: BoxFit.fitWidth,
                  title: 'تصویر پشت کارت ملی',
                  onTap: () {
                    controller.openGallery(controller.backNationalCardFile);
                  },
                  file: controller.backNationalCardFile,
                ),
                SizedBox(
                  height: standardSize
                )
              ],
            ),
            // }
            // ),
            context: context,
          );
        });
  }
}
