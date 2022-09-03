// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import '../../style/colors.dart';
// import '../../style/dimens.dart';
//
// class SearchWidget extends StatefulWidget {
//   const SearchWidget({
//     Key? key,
//     required this.textEditingController,
//     this.validator,
//     this.textInputAction,
//     this.keyboardType,
//     this.onFieldSubmitted,
//     this.onChange,
//     this.onEditingComplete,
//     this.hint,
//   }) : super(key: key);
//
//   final TextEditingController textEditingController;
//   final String? hint;
//   final FormFieldValidator<String>? validator;
//   final TextInputType? keyboardType;
//   final TextInputAction? textInputAction;
//   final ValueChanged<String>? onFieldSubmitted;
//   final ValueChanged<String>? onChange;
//   final VoidCallback? onEditingComplete;
//
//   @override
//   State<SearchWidget> createState() => _TextFormFieldWidgetState();
// }
//
// class _TextFormFieldWidgetState extends State<SearchWidget> {
//   final ThemeData theme = Get.theme;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.textEditingController,
//       textInputAction: widget.textInputAction,
//       keyboardType: widget.keyboardType,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       validator: widget.validator,
//       onEditingComplete: widget.onEditingComplete,
//       onChanged: widget.onChange ??
//           (value) {
//             setState(() {});
//           },
//       style: theme.textTheme.bodyText2?.copyWith(color: Colors.black),
//       decoration: InputDecoration(
//           hintText: widget.hint,
//           counter: const SizedBox(),
//           prefixIcon: Container(
//               margin: EdgeInsets.only(
//                 top: xSmallSize,
//                 bottom: xSmallSize,
//                 right: xSmallSize,
//               ),
//               padding: EdgeInsets.all(3.w),
//               child: SvgPicture.asset(
//                 "assets/ic_search.svg",
//               )),
//           suffixIcon: widget.textEditingController.text.isEmpty
//               ? const SizedBox()
//               : AnimatedOpacity(
//                   duration: const Duration(milliseconds: 200),
//                   opacity: widget.textEditingController.text.isEmpty ? 0 : 1,
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         widget.textEditingController.clear();
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.only(
//                         top: xSmallSize,
//                         bottom: xSmallSize,
//                         right: xSmallSize,
//                       ),
//                       padding: EdgeInsets.all(3.w),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                               color: AppColors.borderColor, width: 1)),
//                       child: Icon(Icons.close,
//                           color: theme.iconTheme.color, size: standardSize),
//                     ),
//                   ),
//                 )),
//     );
//   }
// }
