import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/sec/lawyer_profile_model.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../controller/edit_profile_controller.dart';

class EditProfilePage extends GetView<EditProfileController> {
  LawyerProfileModel entity = LawyerProfileModel(user: null);

  EditProfilePage(
      {
      // required this.controller,
      Key? key})
      : super(key: key);

  bool isFirstLunch = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        init: controller,
        initState: (state) {
          controller.fetchData();
          // print();

        },
        builder: (_) {

          if (isFirstLunch) {
            controller.nameTxtController.text = entity.user?.firstName ?? '';
            controller.lastNameTxtController.text = entity.user?.lastName ?? '';
            controller.fatherNameTxtController.text = entity.user?.fatherName ?? '';
            controller.nationalCodeTxtController.text = entity.user?.national_code ?? '';
            controller.addressTxtController.text = entity.user?.address ?? '';
            controller.zipCodeTxtController.text = entity.user?.zipCode ?? '';
            isFirstLunch = false;
          }

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
            body: controller.obx(
                (state) => ListView(
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
                            textEditingController:
                                controller.lastNameTxtController,
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
                            textEditingController:
                                controller.fatherNameTxtController,
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
                            textEditingController:
                                controller.nationalCodeTxtController,
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
                            textEditingController:
                                controller.addressTxtController,
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
                            textEditingController:
                                controller.zipCodeTxtController,
                          ),
                        ),
                      ],
                    ),
                onEmpty: Container(),
                onLoading: Center(child: CupertinoActivityIndicator())),
            context: context,
          );
        });
  }
}
