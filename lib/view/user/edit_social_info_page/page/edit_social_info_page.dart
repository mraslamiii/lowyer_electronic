import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../binding/edit_social_info_binding.dart';
import '../controller/edit_social_info_controller.dart';

class EditSocialInfoPage extends GetView<EditSocialInfoController> {
  const EditSocialInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditSocialInfoBinding().dependencies();
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
                "اطلاعـات فضای مجازی",
              ),
              leading: backIcon(),
            ),
            body: ListView(
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
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    textDirection: TextDirection.ltr,
                    label: "کد ملی",
                    // onChange: controller.valueChanged,
                    hint: "0923456789",
                    textEditingController: controller.nationalCodeTxtController,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(
                    start: standardSize,
                    end: standardSize,
                    top: standardSize,
                    bottom: standardSize,
                  ),
                  child: TextFormFieldWidget(
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly
                    // ],
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    textDirection: TextDirection.rtl,
                    label: "آدرس دفتر وکیل",
                    // onChange: controller.valueChanged,
                    hint: "آدرس",
                    textEditingController:
                        controller.officeAddressTxtController,
                  ),
                ),
              ],
            ),
            context: context,
          );
        });
  }
}
