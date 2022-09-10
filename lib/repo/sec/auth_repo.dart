import 'package:get/get.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/web_models/auth/auth_web_model.dart';
import 'package:kanoon_dadgostari/web_providers/sec/auth_provider.dart';

import '../../models/base/base_response.dart';
import '../../utilites/app_logger.dart';

class AuthRepository {

  /// Login signup request ///
  Future<String> loginRequest(String phone) async {
    try {
      dynamic response = await AuthAPI().login(phone);

      return response.success ? response.data : throw response.data;
    } catch (e) {
      AppLogger.catchLog(e);
      rethrow;
    }
  }

  /// Login signup request ///
  Future<AuthRPM> registerRequest(RegisterRQM rqm) async {
    try {
      dynamic response = await AuthAPI().register(rqm);



      return response.success ? response.data : throw response.data;
    } catch (e) {
      AppLogger.catchLog(e);
      rethrow;
    }
  }

  /// Login signup request ///
  Future<AuthRPM> loginCodeRequest(String phone, String code) async {
    try {
      dynamic response = await AuthAPI().loginCode(phone, code);

      return response.success ? response.data : throw response.data;

    } catch (e) {
      AppLogger.catchLog(e);
      rethrow;
    }
  }
}
