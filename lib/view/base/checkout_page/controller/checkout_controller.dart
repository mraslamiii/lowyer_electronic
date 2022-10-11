import 'package:get/get.dart';

import '../../../../models/category_model/detail_category_model.dart';
import '../../../../repo/acceptor/category/category_repo.dart';
import '../../../../utilites/app_logger.dart';

class CheckoutController extends GetxController
    with StateMixin<DetailCategoryModel> {
  RxInt counter = 0.obs;
  final CategoryRepo _repo = CategoryRepo();
  late DetailCategoryModel rpm;

  Future getDetailCategory(String id) async {
    try {
      change(null, status: RxStatus.loading());
      rpm = await _repo.getDetailCategory(id);
      if (rpm != null) {
        change(rpm, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      AppLogger.e('$e');
    }
  }
}
