import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../binding/lawyer_upload_image_binding.dart';
import 'package:intl/intl.dart' as dateFormat;
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
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: xSmallSize),
                      // alignment: Alignment.c,
                      child: Text(
                        "a",
                        style: theme.textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        start: standardSize,
                        end: standardSize,
                        top: standardSize,
                      ),
                      child: Container(),
                    ),
                  ],
                ),
              // }
            // ),
            context: context,
          );
        });
  }
}
