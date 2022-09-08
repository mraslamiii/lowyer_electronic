import '../../models/base/safe_convert.dart';

class LoginRQM {
  final String mobile_number;


  LoginRQM({
    this.mobile_number = "",

  });

  factory LoginRQM.fromJson(Map<String, dynamic> json) =>
      LoginRQM(
        mobile_number: asT<String>(json, 'mobile_number', defaultValue: ''),
      );

  Map<String, dynamic> toJson() => {
    'mobile_number': this.mobile_number,
  };
}

class LoginRPM {
  final String status;
  final String data;
  final String message;

  LoginRPM({
    this.status = '',
    this.data = '',
    this.message = '',
  });

  factory LoginRPM.fromJson(Map<String, dynamic> json) => LoginRPM(
    status: asT<String>(json, 'status', defaultValue: ''),
    data: asT<String>(json, 'data', defaultValue: ''),
    message: asT<String>(json, 'message', defaultValue: ''),
  );

  Map<String, dynamic> toJson() => {
    'status': this.status,
    'data': this.data,
    'message': this.message,
  };
}


