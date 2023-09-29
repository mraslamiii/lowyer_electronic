import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/base/base_response.dart';
import 'package:kanoon_dadgostari/models/category_model/category_model.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/utilites/app_logger.dart';

import '../../../../repo/acceptor/category/category_repo.dart';
import '../../../models/category_model/get_all_cat.dart';

class CategoryWelfareCenterController extends GetxController
    with StateMixin<GetAllCategoryModel> {
  final LocalStorageService pref = Get.find<LocalStorageService>();

  GetAllCategoryModel? rpm;

  final CategoryRepo _repo = CategoryRepo();

  Future<bool> back() async {
    printInfo(info: 'back');
    SystemNavigator.pop();
    return true;
  }

  Future getCategoryAcceptor(int id) async {
    try {
      change(null, status: RxStatus.loading());
      rpm = await _repo.getCategoryAcceptor(id);
      if (rpm != null) {
        change(rpm , status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error('$e'));
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
