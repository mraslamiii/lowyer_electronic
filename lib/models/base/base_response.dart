// import 'package:kanoon_dadgostari/models/base/safe_convert.dart';
//
// import '../../utilites/app_logger.dart';
//
import 'package:kanoon_dadgostari/models/base/safe_convert.dart';
import 'package:kanoon_dadgostari/models/base/title_value_model.dart';
import 'package:kanoon_dadgostari/utilites/app_logger.dart';

class BaseResponse<T> {
  int statusCode;
  bool success;
  T? data;
  // List<TitleValueModel>? exception = [];

  BaseResponse({
    this.data,
    this.statusCode = -1,
    this.success = false,
    // this.exception = const [],
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function? fromJsonT) {
    try {
      if (json['data'] is Map<String, dynamic>) {
        if (fromJsonT != null) {
          return BaseResponse(
            data: fromJsonT(json['data']),
            // data: fromJsonT(json['data'].cast<Map<String, dynamic>>()), // json['data'].cast<Map<String, dynamic>>()
            statusCode: asT<int>(json, 'statusCode', defaultValue: -1),
            success: asT<bool>(json, 'success', defaultValue: false),
            // exception: asT<List<TitleValueModel>>(json, 'exception',
            //     defaultValue: const []),
          );
        }

        return BaseResponse(
            data: json['data'] ?? {},
            statusCode: asT<int>(json, 'statusCode', defaultValue: -1),
            success: asT<bool>(json, 'success', defaultValue: false));
            // exception:
                // json['exception'].cast<List>().map((json) => TitleValueModel.fromJson(json)).toList()
             // asT<List>(json, 'exception', defaultValue: const [])
             //        .map((e) => TitleValueModel.fromJson(e))
             //        .toList());
      } else {
        return BaseResponse(
          data: asT<T?>(json, 'data', defaultValue: null),
          statusCode: asT<int>(json, 'statusCode', defaultValue: -1),
          success: asT<bool>(json, 'success', defaultValue: false),
          // exception:TitleValueModel.fromJsonList(json['exception'] ?? [])




          // asT<List<TitleValueModel>>(json, 'exception',
          //     defaultValue: const []),
        );
      }
    } catch (e) {
      AppLogger.catchParse("$e");
      // throw (ExceptionConstants.somethingWentWrong); //todo add exeptions
      throw "$e";
    }
  }
}

//todo parse for list
//  static List<FaqModel> fromJsonList(List<dynamic> jsonList) =>
//       jsonList.map((json) => FaqModel.fromJson(json)).toList();
