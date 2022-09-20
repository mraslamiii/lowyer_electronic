import 'package:kanoon_dadgostari/models/base/base_response.dart';
import 'package:kanoon_dadgostari/models/category_model/category_model.dart';
import 'package:kanoon_dadgostari/models/category_model/detail_category_model.dart';
import 'package:kanoon_dadgostari/web_providers/category_provider/category_provider.dart';

class CategoryRepo {
  Future getCategory() async {
    try {
      Map<String, dynamic> response = await CategoryAPI().categoryApi();
      BaseResponse<AcceptorCategoryModel> result =
          BaseResponse.fromJson(response, AcceptorCategoryModel.fromJson);
      return result;
    } catch (e) {
      rethrow;
    }
  }
  Future getDetailCategory() async {
    try {
      Map<String, dynamic> response = await CategoryAPI().getDetailCategoryApi();
      BaseResponse<DetailCategoryModel> result =
      BaseResponse.fromJson(response, DetailCategoryModel.fromJson);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
