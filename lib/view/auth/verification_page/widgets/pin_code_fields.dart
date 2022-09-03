import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/auth/verification_page/controller/verify_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../res/colors/colors.dart';
import '../../../../res/dimens/dimens.dart';

class PinCodeField extends GetView<VerifyController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (VerifyController controller) => PinCodeTextField(
              controller: controller.pinController,
              validator: (value) {
                if (value!.length < 5) {
                  return "";
                }
                return null;
              },
              cursorColor: Get.theme.primaryColor,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              textStyle: Get.theme.textTheme.headline6,
              length: 5,
              autoDisposeControllers: false,
              errorTextMargin: const EdgeInsets.all(10000000),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(smallRadius),
                borderWidth: 1,
                fieldHeight: fullWidth / 7.7,
                fieldWidth: fullWidth / 7.7,
                selectedColor: Get.theme.primaryColor,
                inactiveFillColor: AppColors.formFieldColor,
                selectedFillColor: AppColors.formFieldColor,
                inactiveColor: AppColors.borderColor,
                activeColor: Get.theme.primaryColor,
                activeFillColor: AppColors.formFieldColor,
              ),
              autoDismissKeyboard: true,
              enablePinAutofill: true,
              showCursor: false,
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              autovalidateMode: AutovalidateMode.disabled,
              enableActiveFill: true,
              appContext: context,
              onCompleted: (value) {
                controller.lengthOK(value);
              },
              onChanged: (value) {
                controller.phoneChanged(value);
                controller.lengthOK(value);
              },
            ));
  }
}
