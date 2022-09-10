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
  'https://images.adsttc.com/media/images/5e13/e676/3312/fdf5/c900/014c/medium_jpg/01.jpg?1578362478',
  'https://cdn.wallpaper.com/main/styles/fp_922x565/s3/facade_of_k11_musea_1.jpg',
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