import 'package:get/get.dart';
import 'package:kanoon_dadgostari/web_models/auth/auth_web_model.dart';
import 'package:kanoon_dadgostari/web_providers/sec/auth_provider.dart';

import '../../service/preferences_service.dart';
import '../../utilites/app_logger.dart';
import '../../web_providers/lawyer_provider/lawyer_provider.dart';

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
  Future<bool> fetchUser() async {
    final LocalStorageService pref = Get.find<LocalStorageService>();
    try {
      var response =
      await LawyersAPI().getProfile(pref.user.lawyerProfile.toString());
      pref.setLawyer(response["data"]);

      return true;
    } catch (e) {
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
