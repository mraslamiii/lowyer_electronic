import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/sec/upload_image_rqm.dart';
import 'package:kanoon_dadgostari/preview_map_page.dart';
import 'package:kanoon_dadgostari/web_models/auth/auth_web_model.dart';
import 'package:kanoon_dadgostari/web_providers/api_endpoints.dart';
import '../../../models/base/base_response.dart';
import '../../models/base/upload_model.dart';
import '../../models/lawyer/info_profile_model.dart';
import '../../utilites/app_logger.dart';
import '../api_provider.dart';

class AuthAPI {
  /// Variable ///

  final APIProvider _provider = Get.find();

  ///  register request ///

  Future<BaseResponse> register(RegisterRQM rqm) async {
    try {
      String endpoint = "";

      String url = APIEndpoint.urlCreator(APIControllers.register, endpoint,
          version: "");
      dynamic response = await _provider.postRequest(url, rqm.toJson());

      BaseResponse baseResponse =
          BaseResponse.fromJson(response, AuthRPM.fromJson);

      return baseResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Login request ///

  Future<BaseResponse> login(String phone) async {
    try {
      Map<String, dynamic> inputs = {'mobile_number': phone};
      String endpoint = "";

      String url =
          APIEndpoint.urlCreator(APIControllers.login, endpoint, version: "");

      dynamic json = await _provider.postRequest(url, inputs);

      BaseResponse baseResponse = BaseResponse.fromJson(json, null);
      return baseResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// login code request ///

  Future<BaseResponse> loginCode(String phone, String code) async {
    try {
      Map<String, dynamic> inputs = {'mobile_number': phone, 'code': code};
      String endpoint = APIEndpoint.code;

      String url =
          APIEndpoint.urlCreator(APIControllers.login, endpoint, version: "");

      dynamic response = await _provider.postRequest(url, inputs);

      BaseResponse baseResponse =
          BaseResponse.fromJson(response, AuthRPM.fromJson);

      return baseResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// logOut request ///
  Future logout() async {
    try {
      Map<String, dynamic> inputs = {};

      String url =
          // 'https://lawyerb.gelareco.ir/api/logout';
          APIEndpoint.urlCreator(APIControllers.logout, '', version: "");

      var response = await _provider.getRequest(url, inputs);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// upload Avatar to uploader ///
  Future uploadImage(File file) async {
    try {
      // Map<String , dynamic> input = {'file' :file};
      // String url = APIEndpoint.urlCreator(controller, APIEndpoint.file);
      String url = 'upload';
      var response = await _provider.uploadRequest(
        url,
        file,
        (sent, total) {
          AppLogger.i("sent:$sent ,total:$total");
        },
      );
      // UploadModel result= UploadModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// upload Avatar  to server///

  Future uploadImageToServer(UploadImageRQM rqm) async {
    try {
      Map<String , dynamic> input = rqm.toJson();
      // String url = APIEndpoint.urlCreator(controller, APIEndpoint.file);
      String url =APIEndpoint.urlCreator(APIControllers.lawyers, APIEndpoint.uploadImage,id: pref.user.lawyerProfile.toString());
      var response = await _provider.postRequest(
        url,
        input,
      );
      // UploadModel result= UploadModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}






/// PercentCalculate ///

num calculatePercent(int sent, int total) => (sent * 100) / total;

class FileClass {
  File file;

  FileClass({required this.file});
}
