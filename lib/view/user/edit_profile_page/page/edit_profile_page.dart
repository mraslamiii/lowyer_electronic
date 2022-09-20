import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../controller/edit_profile_controller.dart';

class EditProfilePage extends GetView<EditProfileController> {
  EditProfilePage({
    Key? key,
  }) : super(key: key);
  bool isFirstLunch = true;

  @override
  EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    var profile = controller.lawyer.profile;
    var user = controller.lawyer.user;
    if (isFirstLunch) {
      controller.nameTxtController.text = user?.firstName ?? '';
      controller.lastNameTxtController.text = user?.lastName ?? '';
      controller.fatherNameTxtController.text = user?.fatherName ?? '';
      controller.nationalCodeTxtController.text = user?.nationalCode ?? '';
      controller.educationTxtController.text = profile?.education ?? '';
      controller.eduLocationTxtController.text = profile?.educationPlace ?? '';
      controller.addressTxtController.text = user?.address ?? '';
      controller.zipCodeTxtController.text = user?.postalCode ?? '';
      controller.eduMajorTxtController.text = profile?.academicDiscipline ?? '';
      controller.educationSelected =
          controller.educations.indexOf(profile?.education ?? '') ;
      isFirstLunch = false;
      controller.update();
    }
    return GetBuilder<EditProfileController>(
        init: controller,
        initState: (state) {
          // controller.fetchData();
        },
        builder: (_) {
          return customScaffold(
            bottomAppBar: BottomAppBar(
              elevation: 0,
              child: Container(
                margin: EdgeInsets.all(standardSize),
                child: SizedBox(
                  width: fullWidth,
                  child: progressButton(
                    isProgress: controller.isBusyProfile.value,
                    onTap: () {
                      controller.editProfileEducation();
                    },
                    text: "ثبت اطلاعات",
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              title: const Text("ویـرایش پروفایل"),
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
                    hint: "کد ملی",
                    textEditingController: controller.nationalCodeTxtController,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(
                    bottom: xSmallSize,
                    start: standardSize,
                    top: standardSize,
                  ),
                  // alignment: Alignment.c,
                  child: Text(
                    "تحصیلات",
                    style: Get.theme.textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    customBottomSheet(
                      context,
                      ListView.builder(
                        padding: EdgeInsetsDirectional.only(
                          bottom: fullHeight / 18,
                        ),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.educations.length,
                        itemBuilder: (context, index) {
                          return sheetItem(
                            context: context,
                            title: controller.educations[index] ?? '',
                            index: index,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsetsDirectional.only(
                      start: standardSize,
                      end: standardSize,
                    ),
                    padding: EdgeInsets.all(standardSize),
                    decoration: BoxDecoration(
                      color: AppColors.formFieldColor,
                      borderRadius: BorderRadius.circular(smallRadius),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.educationSelected !=-1 ?
                          controller
                                  .educations[controller.educationSelected ] : 'تحصیلات',
                          style: Get.theme.textTheme.bodyText1?.copyWith(
                            color: controller.educationSelected != -1
                                ? Colors.black
                                : AppColors.hintColor,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/ic_arrow_down.svg",
                          color: Colors.black,
                        ),
                      ],
                    ),
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
                    label: "رشته تحصیلی",
                    // onChange: controller.valueChanged,
                    hint: "رشته تحصیلی",
                    textEditingController: controller.eduMajorTxtController,
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
                    label: "محل تحصیل",
                    // onChange: controller.valueChanged,
                    hint: "محل تحصیل",
                    textEditingController: controller.eduLocationTxtController,
                  ),
                ),
/*
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
                    textDirection: TextDirection.rtl,
                    label: "تلفن ثابت",
                    // onChange: controller.valueChanged,
                    hint: "05138842596",
                    textEditingController: controller.phoneTxtController,
                  ),
                ),
*/
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
                    textInputAction: TextInputAction.done,
                    textDirection: TextDirection.ltr,
                    label: "کد پستی",
                    // onChange: controller.valueChanged,
                    hint: "0123456789",
                    textEditingController: controller.zipCodeTxtController,
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
        });
  }

  Widget sheetItem({
    required BuildContext context,
    required int index,
    required String title,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        controller.educationSelected = index;
        controller.update();
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: smallSize),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallRadius),
          color: controller.educationSelected == index
              ? AppColors.primaryColor.withOpacity(0.2)
              : Colors.transparent,
          border: Border.all(
            width: 1,
            color: controller.educationSelected == index
                ? AppColors.primaryColor
                : AppColors.borderColor,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: largeSize / 1.2,
          horizontal: standardSize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: Get.theme.textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Visibility(
              visible: false,
              child: Radio(
                value: controller.educationSelected ?? 0,
                groupValue: index,
                onChanged: (val) {
                  controller.educationSelected == val;
                },
              ),
            ),
            SvgPicture.asset(
              controller.educationSelected == index
                  ? 'assets/icons/ic_selected.svg'
                  : 'assets/icons/ic_unselected.svg',
              height: iconSizeSmall,
              width: iconSizeSmall,
            ),
          ],
        ),
      ),
    );
  }
}
