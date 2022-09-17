import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';

import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../controller/edit_social_info_controller.dart';

class EditSocialInfoPage extends GetView<EditSocialInfoController> {
  EditSocialInfoPage({Key? key}) : super(key: key);
  bool isFirstLunch = true;

  @override
  Widget build(BuildContext context) {
    if (isFirstLunch) {
      controller.instagramTxtController.text =
          controller.pref.lawyer.data?.profile?.instagram ?? '';
      controller.whatsAppTxtController.text =
          controller.pref.lawyer.data?.profile?.whatsApp ?? '';
      controller.websiteTxtController.text =
          controller.pref.lawyer.data?.profile?.webSite ?? '';
      isFirstLunch = false;
      controller.update();
    }
    return GetBuilder<EditSocialInfoController>(
      init: controller,
      // initState: (state) {
      //   controller.fetchData();
      //   print();
      // },
      builder: (_) {
        return customScaffold(
          bottomAppBar: BottomAppBar(
              elevation: 0,
              child: Container(
                margin: EdgeInsets.all(standardSize),
                child: SizedBox(
                  width: fullWidth,
                  child: progressButton(
                    isProgress: controller.isBusySocial.value,
                      onTap: () {
                        controller.editSocialMedia();
                      },
                      text: "ثبت اطلاعات"),
                ),
              )),
          appBar: AppBar(
            title: const Text(
              "اطلاعـات فضای مجازی",
            ),
            leading: backIcon(),
          ),
          body:
              // controller.obx(
              //   (state) =>
              ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                margin: EdgeInsetsDirectional.only(
                  start: standardSize,
                  end: standardSize,
                  top: standardSize,
                ),
                child: TextFormFieldWidget(
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.digitsOnly
                  // ],
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textDirection: TextDirection.ltr,
                  label: "آدرس صفحه اینستاگرام",
                  // onChange: controller.valueChanged,
                  hint: "www.instagram.com",
                  textEditingController: controller.instagramTxtController,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                  start: standardSize,
                  end: standardSize,
                  top: standardSize,
                ),
                child: TextFormFieldWidget(
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.digitsOnly
                  // ],
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textDirection: TextDirection.ltr,
                  label: "آدرس آیدی واتساپ",
                  // onChange: controller.valueChanged,
                  hint: "www.whatsapp.com",
                  textEditingController: controller.whatsAppTxtController,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                  start: standardSize,
                  end: standardSize,
                  top: standardSize,
                ),
                child: TextFormFieldWidget(
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.digitsOnly
                  // ],
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textDirection: TextDirection.ltr,
                  label: "آدرس وب سایت",
                  // onChange: controller.valueChanged,
                  hint: "www.example.com",
                  textEditingController: controller.websiteTxtController,
                ),
              ),
            ],
          ),
          // onEmpty: Container(),
          // onError: (error) => Text(
          //   'خطا در ارتباط با سرور',
          //   style: Get.theme.textTheme.subtitle1,
          // ),
          // onLoading: const Center(
          //   child: CupertinoActivityIndicator(),
          // ),
          // ),
          context: context,
        );
      },
    );
  }
}
