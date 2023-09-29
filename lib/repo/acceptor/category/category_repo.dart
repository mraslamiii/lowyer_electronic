import 'package:kanoon_dadgostari/models/base/base_response.dart';
import 'package:kanoon_dadgostari/models/category_model/category_model.dart';
import 'package:kanoon_dadgostari/models/category_model/detail_category_model.dart';
import 'package:kanoon_dadgostari/web_providers/category_provider/category_provider.dart';

import '../../../models/category_model/get_all_cat.dart';

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
  Future getDetailCategory(String id) async {
    try {
      Map<String, dynamic> response = await CategoryAPI().getDetailCategoryApi(id);
      BaseResponse<DetailCategoryModel> result =
      BaseResponse.fromJson(response, DetailCategoryModel.fromJson);
      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  Future getCategoryAcceptor(int id) async {
    try {
      Map<String, dynamic> response = await CategoryAPI().getCategoryAcceptorApi(id);
      GetAllCategoryModel result =
      GetAllCategoryModel.fromJson(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }

}
