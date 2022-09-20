import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/base/base_response.dart';
import 'package:kanoon_dadgostari/models/category_model/category_model.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/utilites/app_logger.dart';

import '../../../../repo/acceptor/category/category_repo.dart';


class WelfareCenterController extends GetxController with StateMixin<AcceptorCategoryModel>{
  final LocalStorageService pref = Get.find<LocalStorageService>();


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
  late BaseResponse<AcceptorCategoryModel> rpm ;
  final CategoryRepo _repo = CategoryRepo();




  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }
  Future getCategory()async{
    try{
      change(null,status: RxStatus.loading());
      rpm = await _repo.getCategory();
      if (rpm !=null) {
        change(rpm.data,status: RxStatus.success());
      }  else{
        change(null,status: RxStatus.empty());
      }

    }catch(e){
      AppLogger.e('$e');
    }
  }





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