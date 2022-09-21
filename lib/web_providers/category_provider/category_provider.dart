import 'package:get/get.dart';
import 'package:kanoon_dadgostari/web_providers/api_endpoints.dart';
import '../api_provider.dart';

class CategoryAPI {
  final APIProvider _provider = Get.find();

  Future categoryApi() async {
    Map<String, dynamic> input = {};
    try {
      String url =
          APIEndpoint.urlCreator(APIControllers.acceptor, APIEndpoint.category);
      var response = await _provider.getRequest(url, input);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future getDetailCategoryApi(String id) async {
    Map<String, dynamic> input = {};
    try {
      String url =
      APIEndpoint.urlCreator(APIControllers.acceptor,id);
      var response = await _provider.getRequest(url, input);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
