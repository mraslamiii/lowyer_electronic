import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/base/base_response.dart';
import 'package:kanoon_dadgostari/models/category_model/detail_category_model.dart';
import 'package:kanoon_dadgostari/repo/acceptor/category/category_repo.dart';

import '../../../../utilites/app_logger.dart';

class WelfareCenterDetailController extends GetxController
    // with StateMixin<DetailCategoryModel>
{
   // final CategoryRepo _repo = CategoryRepo();
   // late BaseResponse<DetailCategoryModel> rpm;

  // Future getDetailCategory()async{
  //   try{
  //     change(null,status: RxStatus.loading());
  //     rpm = await _repo.getDetailCategory();
  //     if (rpm !=null) {
  //       change(rpm.data,status: RxStatus.success());
  //     }  else{
  //       change(null,status: RxStatus.empty());
  //     }
  //
  //   }catch(e){
  //     AppLogger.e('$e');
  //   }
  // }
  RxInt counter = 0.obs;
}
