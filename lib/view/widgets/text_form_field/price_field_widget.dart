// mport 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:get/get.dart';
// import 'package:meta_york/src/presentation/widgets/text_form_field/text_form_field_widget.dart';
//
// import '../../style/colors.dart';
// import '../../style/dimens.dart';
// import '../switch_widget.dart';
//
// Widget priceFieldWidget({
//   required TextEditingController textEditingController,
//   required RxBool isChecked,
//   String? textFieldLabel,
//   String? textFieldHint,
//   String? switchLabel,
// }) {
//   final theme = Get.theme;
//
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     crossAxisAlignment: CrossAxisAlignment.end,
//     children: [
//       Expanded(
//         child: Obx(
//           () => TextFormFieldWidget(
//             textEditingController: textEditingController,
//             label: textFieldLabel,
//             hint: textFieldHint,
//             keyboardType: TextInputType.number,
//             textInputAction: TextInputAction.next,
//             isEnable: !isChecked.value,
//             validator: (value) {
//               if (value?.isEmpty ?? true) {
//                 return "please_fill".tr;
//               }
//               return null;
//             },
//             suffixWidget: Row(
//               children: [
//                 SizedBox(width: smallSize),
//                 InkWell(
//                   splashColor: AppColors.splashColor,
//                   borderRadius: BorderRadius.circular(xSmallRadius),
//                   onTap: () {
//                     isChecked.value = !isChecked.value;
//                   },
//                   child: Obx(
//                     () => Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: isChecked.value
//                               ? AppColors.successfulColor
//                               : AppColors.borderColor,
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(xSmallRadius),
//                         color: Colors.transparent,
//                       ),
//                       padding: EdgeInsetsDirectional.all(smallSize),
//                       height: fullHeight / 16.2,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             switchLabel ?? "free".tr,
//                             style: theme.textTheme.bodyText1!.copyWith(
//                               color: isChecked.value
//                                   ? AppColors.successfulColor
//                                   : Colors.black,
//                             ),
//                           ),
//                           SizedBox(width: standardSize),
//                           switchWidget(value: isChecked),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }
