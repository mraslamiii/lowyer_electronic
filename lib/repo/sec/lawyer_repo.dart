import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/sec/lawyer_profile_model.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/web_models/auth/auth_web_model.dart';
import 'package:kanoon_dadgostari/web_providers/sec/auth_provider.dart';

import '../../models/base/base_response.dart';
import '../../utilites/app_logger.dart';
import '../../web_providers/sec/lawyer_provider.dart';

class LawyersRepository {

  /// Login signup request ///
  Future<LawyerProfileModel> getLawyer(String id) async {
    try {
      BaseResponse response = await LawyersAPI().getProfile(id);

      return response.success ? response.data : throw response.data;
    } catch (e) {
      AppLogger.catchLog(e);
      rethrow;
    }
  }
}
