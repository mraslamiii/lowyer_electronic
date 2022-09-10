import 'package:get/get.dart';
import 'package:kanoon_dadgostari/web_providers/api_endpoints.dart';
import '../../../models/base/base_response.dart';
import '../../models/sec/lawyer_profile_model.dart';
import '../api_provider.dart';


class LawyersAPI {
  /// Variable ///

  final APIProvider _provider = Get.find();

  ///  register request ///


  Future<BaseResponse> getProfile(String id) async {
    try {

      String url = APIEndpoint.urlCreator(APIControllers.lawyers, id);
      dynamic response = await _provider.getRequest(url, {});

      BaseResponse baseResponse =  BaseResponse.fromJson(response, LawyerProfileModel.fromJson);

      return baseResponse;
    } catch (e) {
      rethrow;
    }
  }


  /// Login request ///

  // Future<BaseResponse> login(String phone) async {
  //   try {
  //     Map<String, dynamic> inputs = {'mobile_number': phone};
  //     String endpoint = "";
  //
  //     String url =
  //         APIEndpoint.urlCreator(APIControllers.login, endpoint, version: "");
  //
  //     dynamic json = await _provider.postRequest(url, inputs);
  //
  //     BaseResponse baseResponse =  BaseResponse.fromJson(json, null);
  //     return baseResponse;
  //   } catch (e) {
  //
  //
  //     rethrow;
  //   }
  // }

  /// login code request ///

  // Future<BaseResponse> loginCode(String phone, String code) async {
  //   try {
  //     Map<String, dynamic> inputs = {'mobile_number': phone, 'code': code};
  //     String endpoint = APIEndpoint.code;
  //
  //     String url =
  //         APIEndpoint.urlCreator(APIControllers.login, endpoint, version: "");
  //
  //     dynamic response = await _provider.postRequest(url, inputs);
  //
  //     BaseResponse baseResponse =  BaseResponse.fromJson(response, AuthRPM.fromJson);
  //
  //
  //     return baseResponse;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
