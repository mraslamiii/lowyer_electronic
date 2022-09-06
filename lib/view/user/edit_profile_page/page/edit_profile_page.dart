import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/base/scan_search_page/binding/scan_search_binding.dart';
import 'package:kanoon_dadgostari/view/user/edit_profile_page/binding/edit_profile_binding.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../controller/edit_profile_controller.dart';

class EditProfilePage extends GetView<EditProfileController> {
  EditProfilePage(
      {
      // required this.controller,
      Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    EditProfileBinding().dependencies();
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
            body: ListView(
              physics: BouncingScrollPhysics(),
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
                    textDirection: TextDirection.rtl,
                    label: "نـام",
                    // onChange: controller.valueChanged,
                    hint: "نام",
                    textEditingController: controller.nameTxtController,
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
                    textDirection: TextDirection.rtl,
                    label: "نـام خانوادگی",
                    // onChange: controller.valueChanged,
                    hint: "نـام خانوادگی",
                    textEditingController: controller.lastNameTxtController,
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
                    textDirection: TextDirection.rtl,
                    label: "نام پدر",
                    // onChange: controller.valueChanged,
                    hint: "نـام پدر",
                    textEditingController: controller.fatherNameTxtController,
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
                  ),
                  child: TextFormFieldWidget(
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly
                    // ],
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textDirection: TextDirection.rtl,
                    label: "آدرس",
                    // onChange: controller.valueChanged,
                    hint: "آدرس",
                    textEditingController: controller.addressTxtController,
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
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    textDirection: TextDirection.ltr,
                    label: "کد پستی",
                    // onChange: controller.valueChanged,
                    hint: "0123456789",
                    textEditingController: controller.zipCodeTxtController,
                  ),
                ),
              ],
            ),
            context: context,
          );
        });
  }
}
