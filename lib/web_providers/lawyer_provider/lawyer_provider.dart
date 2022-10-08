import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/lawyer/lawyer_rqm/edit_social_rqm.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/web_providers/api_endpoints.dart';
import '../../models/lawyer/lawyer_rqm/edit_address_rqm.dart';
import '../../models/lawyer/lawyer_rqm/edit_education_rqm.dart';
import '../api_provider.dart';

class LawyersAPI {
  /// Variable ///

  final APIProvider _provider = Get.find();

  ///  register request ///

  Future getProfile(String id) async {
    try {
      Map<String, dynamic> inputs = {};
      String url = APIEndpoint.urlCreator(APIControllers.lawyers, id);
      var response = await _provider.getRequest(url, inputs);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future editProfileEd(EditEducationRQM rqm) async {
    LocalStorageService pref = Get.find();
    try {
      Map<String, dynamic> inputs = rqm.toJson();

      String url = APIEndpoint.urlCreator(
          APIControllers.lawyers, APIEndpoint.education,
          id: pref.user.lawyerProfile.toString());
      var response = await _provider.postRequest(url, inputs);
      return response["data"];
    } catch (e) {
      rethrow;
    }
  }
  Future editAddress(EditAddressRQM rqm) async {
    LocalStorageService pref = Get.find();
    try {
      Map<String, dynamic> inputs = rqm.toJson();

      String url = APIEndpoint.urlCreator(
          APIControllers.lawyers, APIEndpoint.uploadImage,
          id: pref.user.lawyerProfile.toString());
      var response = await _provider.postRequest(url, inputs);
      return response["data"];
    } catch (e) {
      rethrow;
    }
  }
  Future editSocialMedia(EditSocialRQM rqm) async {
    LocalStorageService pref = Get.find();
    try {
      Map<String, dynamic> inputs = rqm.toJson();

      String url = APIEndpoint.urlCreator(
          APIControllers.lawyers, APIEndpoint.social,
          id: pref.user.lawyerProfile.toString());
      var response = await _provider.postRequest(url, inputs);
      return response["data"];
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
