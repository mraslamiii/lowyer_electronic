import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';


class WelfareCenterController extends GetxController {
  final LocalStorageService pref = Get.find<LocalStorageService>();




  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }


  List<String> images = [
    'https://s6.uupload.ir/files/pic_welfare_foods_jc6a.jpg',
    'https://s6.uupload.ir/files/pic_welfare_dress_zkbv.jpg',
    'https://s6.uupload.ir/files/pic_welfare_medicine_kt5x.jpg'
  ];
  List<String> titles = ['مواد غذایی', 'پوشـاک', 'دارو'];

List<String> shoppingImages = [
  'https://s6.uupload.ir/files/rectangle_2035_duic.jpg',
  'https://s6.uupload.ir/files/rectangle_2035_crvk.png',
];

}



// Future getBasicData() async {
//   bool result = await _useCase.execute();
//
//
//   if (result == true) {
//     showError.value = false;
//   } else{
//     showError.value = true;
//   }
//
// }