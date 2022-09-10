import 'package:kanoon_dadgostari/models/sec/user_model.dart';

import '../../models/base/safe_convert.dart';

class RegisterRQM {
  final String nationalCode;
  final String firstName;
  final String lastName;
  final String mobileNumber;

  RegisterRQM({
    this.nationalCode = '',
    this.firstName = '',
    this.lastName = '',
    this.mobileNumber = '',
  });

  Map<String, dynamic> toJson() => {
        'national_code': nationalCode,
        'first_name': firstName,
        'last_name': lastName,
        'mobile_number': mobileNumber,
      };
}

class AuthRPM {
  final User? user;
  final String token;

  AuthRPM({
    this.user,
    this.token = '',
  });

  Map<String, dynamic> toJson() => {
        'user': user,
        'token': token,
      };

  factory AuthRPM.fromJson(Map<String, dynamic> json) => AuthRPM(
        user: User.fromJson(asT<Map<String, dynamic>>(json, 'user')),
        token: asT<String>(json, 'token', defaultValue: ''),
      );
}
