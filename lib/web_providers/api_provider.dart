import 'dart:convert' show json, jsonDecode;
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/base/base_response.dart';
import 'package:kanoon_dadgostari/utilites/app_logger.dart';

import '../service/preferences_service.dart';
import '../app/app_exeption.dart';
import 'api_endpoints.dart';

class APIProvider extends GetxService {
  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;
  Future<T> upLoadTestRequest<T>(String url,File data,
      {bool hasBaseResponse = true}) async {
    Map<String, String> _headers = Get.find<LocalStorageService>().headers;

    BaseOptions _postOptions = BaseOptions(
        baseUrl: APIEndpoint.apiBaseURL,
        contentType: ContentType.json.value,
        headers: _headers,
        connectTimeout: 12000,
        receiveTimeout: 12000,
        method: 'Post',
        maxRedirects: 5);

    Dio _dio = Dio(_postOptions);

    debugPrint("postRequest: ${_dio.options.baseUrl}$url");

    try {
      dio.Response response;
       response = await _dio.post(
        url,
        data: data,

      );
      // if (data.path.isNotEmpty) {
      //   response = await _dio.post(url, data: data);
      // } else {
      //   response = await _dio.post(url);
      // }
      if (response.data is String) {
        String data = response.data;

        Map<String, dynamic> list = await json.decode(data);
        return list as T;
      }
      return _returnResponse(response);
    } on DioError catch (dioError) {
      debugPrint("dioError url:$url postRequest: $dioError");

      return _returnResponse(dioError.response);
    } catch (e) {
      printError(info: "getRequest: catch: $e");
      throw (FetchDataException);
    }
  }



  Future<T> postRequest<T>(String url, Map<String, dynamic> data,
      {bool hasBaseResponse = true}) async {
    Map<String, String> _headers = Get.find<LocalStorageService>().headers;

    BaseOptions _postOptions = BaseOptions(
        baseUrl: APIEndpoint.apiBaseURL,
        contentType: ContentType.json.value,
        headers: _headers,
        connectTimeout: 12000,
        receiveTimeout: 12000,
        method: 'Post',
        maxRedirects: 5);

    Dio _dio = Dio(_postOptions);

    debugPrint("postRequest: ${_dio.options.baseUrl}$url");

    try {
      dio.Response response;

      if (data.isNotEmpty) {
        response = await _dio.post(url, data: data);
      } else {
        response = await _dio.post(url);
      }
      if (response.data is String) {
        String data = response.data;

        Map<String, dynamic> list = await json.decode(data);
        return list as T;
      }
      return _returnResponse(response);
    } on DioError catch (dioError) {
      debugPrint("dioError url:$url postRequest: $dioError");

      return _returnResponse(dioError.response);
    } catch (e) {
      printError(info: "getRequest: catch: $e");
      throw (FetchDataException);
    }
  }

  Future<T> getRequest<T>(String url, Map<String, dynamic>? data,
      {bool hasBaseResponse = true}) async {
    try {
      Map<String, String> _headers = Get.find<LocalStorageService>().headers;
      BaseOptions _postOptions = BaseOptions(
          baseUrl: APIEndpoint.apiBaseURL,
          contentType: ContentType.json.value,
          headers: _headers,
          connectTimeout: 12000,
          receiveTimeout: 12000,
          method: 'get',
          maxRedirects: 5);

      Dio _dio = Dio(_postOptions);
      debugPrint("getRequest: ${_dio.options.baseUrl}$url");

      dio.Response response;

      if (data != null && data.isNotEmpty) {
        response = await _dio.get(url, queryParameters: data);
      } else {
        response = await _dio.get(url);
      }
      if (response.data is String) {
        String data = response.data;

        Map<String, dynamic> list = await json.decode(data);
        return list as T;
      }
      return _returnResponse(response);
    } on DioError catch (dioError) {
      debugPrint("dioError url:$url getRequest: $dioError");

      return _returnResponse(dioError.response);
    } catch (e) {
      debugPrint("getRequest: catch: $e");
      rethrow;
    }
  }

  Future<T> getListRequest<T>(
    String url,
    Map<String, dynamic> data,
  ) async {
    Map<String, String> _headers = Get.find<LocalStorageService>().headers;
    BaseOptions _postOptions = BaseOptions(
        baseUrl: APIEndpoint.apiBaseURL,
        contentType: ContentType.json.value,
        headers: _headers,
        connectTimeout: 12000,
        receiveTimeout: 12000,
        method: 'Post',
        maxRedirects: 5);

    Dio _dio = Dio(_postOptions);
    debugPrint("getListRequest: ${_dio.options.baseUrl} $url");

    try {
      var response = await _dio.get(url, queryParameters: data);

      if (response.data is String) {
        String data = response.data;

        List list = await json.decode(data);
        return list as T;
      }
      return response.data;
    } on DioError catch (dioError) {
      debugPrint("dioError postListRequest: $dioError");
      return _returnResponse(dioError.response);
    } catch (e) {
      debugPrint("postListRequest: catch: $e");
      throw ('$e');
    }
  }

  Future<T> deleteRequest<T>(String url, Map<String, dynamic> data,
      {bool hasBaseResponse = true}) async {
    try {
      Map<String, String> _headers = Get.find<LocalStorageService>().headers;
      BaseOptions _postOptions = BaseOptions(
          baseUrl: APIEndpoint.apiBaseURL,
          contentType: ContentType.json.value,
          headers: _headers,
          connectTimeout: 12000,
          receiveTimeout: 12000,
          method: 'Post',
          maxRedirects: 5);

      Dio _dio = Dio(_postOptions);
      debugPrint("getRequest: ${_dio.options.baseUrl}$url");
      var response = await _dio.delete(url, queryParameters: data);

      if (response.data is String) {
        String data = response.data;

        Map<String, dynamic> list = await json.decode(data);
        return list as T;
      }
      return _returnResponse(response);
    } on DioError catch (dioError) {
      debugPrint("dioError url:$url getRequest: $dioError");
      return _returnResponse(dioError.response);
    } catch (e) {
      debugPrint("getRequest: catch: $e");
      rethrow;
    }
  }

  Future<T> updateRequest<T>(String url, Map<String, dynamic> data,
      {bool hasBaseResponse = false}) async {
    Map<String, String> _headers = Get.find<LocalStorageService>().headers;
    BaseOptions _postOptions = BaseOptions(
        baseUrl: APIEndpoint.apiBaseURL,
        contentType: ContentType.json.value,
        headers: _headers,
        connectTimeout: 12000,
        receiveTimeout: 12000,
        method: 'post',
        maxRedirects: 5);

    Dio _dio = Dio(_postOptions);
    debugPrint("putRequest: ${_dio.options.baseUrl}$url");

    try {
      dio.Response response;

      if (data.isNotEmpty) {
        response = await _dio.put(url, data: data);
      } else {
        response = await _dio.put(url);
      }
      if (response.data is String) {
        String data = response.data;

        Map<String, dynamic> list = await json.decode(data);
        return list as T;
      }
      return _returnResponse(response);
    } on DioError catch (dioError) {
      debugPrint("dioError url:$url getRequest: $dioError");
      return _returnResponse(dioError.response);
    } catch (e) {
      printError(info: "getRequest: catch: $e");
      throw (FetchDataException);
    }
  }
  Future upload(File file,String url) async {
    String fileName = file.path.split('/').last;
    print(fileName);

    dio.FormData data =  dio.FormData.fromMap({
      "file": await  dio.MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio _dio = Dio();

    _dio.post(url, data: data).then((response) {
      var jsonResponse = jsonDecode(response.toString());
      var testData = jsonResponse['histogram_counts'].cast<double>();
      var averageGrindSize = jsonResponse['average_particle_size'];
      return jsonResponse;
    }).catchError((error) => print(error));
  }
  Future<T> uploadRequest<T>(
      String url, File file, Function(int sent, int total) progressFunc,
      {bool hasBaseResponse = true}) async {
    String fileName = file.path.split('/').last;

    dio.FormData data =  dio.FormData.fromMap({
      "file": await  dio.MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });


    // dio.FormData data = dio.FormData.fromMap({
    //   fileName: [await dio.MultipartFile.fromFile("file", filename: fileName)
    //   ]
    // });

    Map<String, String> _headers = Get.find<LocalStorageService>().headers;

    BaseOptions _postOptions = BaseOptions(
        baseUrl: APIEndpoint.apiBaseURL,
        contentType: ContentType.json.value,
        headers: _headers,
        connectTimeout: 12000,
        receiveTimeout: 12000,
        maxRedirects: 5,
        method: 'Post');
//***********************************************
    Dio _dio = Dio(_postOptions);
    debugPrint("uploadRequest: $fileName");
    var response = await _dio.post(
      url,
      data: data,
      onReceiveProgress: (count, total) {
        debugPrint("Received $fileName received: $count of $total");
      },
      onSendProgress: progressFunc,
    );
    debugPrint("uploadRequest: $fileName response: $response");

    try {
      if (response.data is String) {
        String data = response.data;

        var item = await json.decode(data);
        return item;
      }
      return _returnResponse(response);
    } on DioError catch (dioError) {
      return _returnResponse(response);
    } catch (e) {
      debugPrint("getRequest: catch: $e");
      rethrow;
    }
  }

  dynamic _returnResponse(dio.Response? response) {
    switch (response?.statusCode) {
      case 200:
        try {
          return response?.data;
        } catch (e) {
          throw jsonDecode(response?.data);
        }
      case 201:
        try {
          return response?.data;


          // var responseJson = jsonDecode(response?.data);
          // return responseJson;
        } catch (e) {
          throw jsonDecode(response?.data);
        }

      case 400:
      // throw BadRequestException(response?.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response?.data.toString());
      case 404:
      // throw UnauthorisedException(response?.data.toString());
      case 500:
      default:
        var body = response?.data;

        BaseResponse baseResponse = BaseResponse.fromJson(body, null);
      throw baseResponse.data.toString();
      // throw FetchDataException(FetchDataException
      //     'Error occured while communication with server' +
      //         ' with status code : ${response?.statusCode}');
    }
  }
}
