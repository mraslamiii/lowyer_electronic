import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class ScanSearchController extends GetxController {
  final LocalStorageService pref = Get.find<LocalStorageService>();


  @override
  void onInit() {
    qrViewController?.resumeCamera();
    update();
    super.onInit();
  }

  TextEditingController codeTxtController = TextEditingController();
  RxString codeTxt = ''.obs;

  void valueChanged(String val) {
    codeTxt.value = val;
  }

  QRViewController? qrViewController;


  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }


  List<String> images = [
    'https://m3.healio.com/~/media/slack-news/stock-images/fm_im/u/ultraprocessed-foods.jpg',
    'https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq',
    'https://i.guim.co.uk/img/media/20491572b80293361199ca2fc95e49dfd85e1f42/0_236_5157_3094/master/5157.jpg?width=1200&quality=85&auto=format&fit=max&s=6c20695f8d0e980ee80d47265efee6c5'
  ];
  List<String> titles = ['مراکز خـرید', 'پوشـاک', 'دارو'];

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