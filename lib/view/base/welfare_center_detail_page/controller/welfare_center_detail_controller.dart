import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kanoon_dadgostari/models/base/base_response.dart';
import 'package:kanoon_dadgostari/models/category_model/detail_category_model.dart';
import 'package:kanoon_dadgostari/models/entity/basket/service_entity.dart';
import 'package:kanoon_dadgostari/repo/acceptor/category/category_repo.dart';

import '../../../../utilites/app_logger.dart';
import '../../../../utilites/hive_utils/hive_utils.dart';

class WelfareCenterDetailController extends GetxController with StateMixin<DetailCategoryModel>{

  final CategoryRepo _repo = CategoryRepo();
   late DetailCategoryModel rpm;
  // List<String> ids =['1','2','3',
  //
  //   '4',
  //   '5',
  //   '6',
  // ];
  Future getDetailCategory(String id)async{
    try{
      change(null,status: RxStatus.loading());
      rpm = await _repo.getDetailCategory(id);
      if (rpm !=null) {
        change(rpm,status: RxStatus.success());
      }  else{
        change(null,status: RxStatus.empty());
      }

    }catch(e){
      AppLogger.e('$e');
    }
  }
  // RxInt counter = 0.obs;

  ///hive ////

}
