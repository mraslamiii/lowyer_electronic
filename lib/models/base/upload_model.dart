

import 'package:kanoon_dadgostari/models/base/safe_convert.dart';

class UploadModel {
  final int statusCode;
  final bool success;
  final String data;
  final dynamic exception;

  UploadModel({
    this.statusCode = 0,
    this.success = false,
    this.data = "",
    this.exception,
  });

  factory UploadModel.fromJson(Map<String, dynamic>? json) => UploadModel(
    statusCode: asT<int>(json, 'statusCode'),
    success: asT<bool>(json, 'success'),
    data: asT<String>(json, 'data'),
    exception: asT<dynamic>(json, 'exception'),
  );

  Map<String, dynamic> toJson() => {
    'statusCode': statusCode,
    'success': success,
    'data': data,
    'exception': exception,
  };
}

