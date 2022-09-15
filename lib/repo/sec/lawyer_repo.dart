import 'package:get/get.dart';
import 'package:kanoon_dadgostari/models/sec/lawyer_profile_model.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/web_models/auth/auth_web_model.dart';
import 'package:kanoon_dadgostari/web_providers/sec/auth_provider.dart';

import '../../models/base/base_response.dart';
import '../../models/sec/edit_education_rqm.dart';
import '../../models/sec/info_profile_model.dart';
import '../../models/sec/profile_vakil_model.dart';
import '../../utilites/app_logger.dart';
import '../../web_providers/sec/lawyer_provider.dart';

class LawyersRepository {
  LocalStorageService pref = Get.find();
  Future<InfoProfileModel> changeUserData(EditEducationRQM rqm) async {
    try {
      var response = await LawyersAPI().changeEducation(rqm);
      InfoProfileModel result = InfoProfileModel.fromJson(response);
      InfoProfileModel _model = pref.lawyer;
      _model = result;
      pref.lawyer = _model;
      return result;
    } catch (e) {
      rethrow;
    }
  }
//

Future<InfoProfileModel> getLawyer(String id) async {
  try {
    var response = await LawyersAPI().getProfile(id);
    InfoProfileModel result =  InfoProfileModel.fromJson(response);
    return  result ;
  } catch (e) {
    AppLogger.catchLog(e);
    rethrow;
  }
}

}
