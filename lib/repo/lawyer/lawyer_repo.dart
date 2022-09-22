import 'package:get/get.dart';
import 'package:kanoon_dadgostari/enums/snackbar_type.dart';
import 'package:kanoon_dadgostari/models/lawyer/lawyer_rqm/edit_social_rqm.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/enums/result_enum.dart';
import 'package:kanoon_dadgostari/utilites/show_result.dart';

import '../../models/lawyer/lawyer_rqm/edit_address_rqm.dart';
import '../../models/lawyer/lawyer_rqm/edit_education_rqm.dart';
import '../../models/lawyer/info_profile_model.dart';
import '../../utilites/app_logger.dart';
import '../../web_providers/lawyer_provider/lawyer_provider.dart';

class LawyersRepository {
  LocalStorageService pref = Get.find();

  Future<bool> editProfile(EditEducationRQM rqm) async {
    try {
      var response = await LawyersAPI().editProfileEd(rqm);
      pref.setLawyer(response);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> editAddress(EditAddressRQM rqm) async {
    try {
      var response = await LawyersAPI().editAddress(rqm);
      pref.setLawyer(response);
      return true;
    } catch (e) {
      showTheResult(resultType: SnackbarType.error,
          showTheResultType: ShowTheResultType.snackBar,
          title: 'Error',
          message: '$e');
      rethrow;
    }
  }

  Future<bool> editSocial(EditSocialRQM rqm) async {
    try {
      var response = await LawyersAPI().editSocialMedia(rqm);
      pref.setLawyer(response);
      // pref.lawyer = _model;
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<InfoProfileModel> getLawyer(String id) async {
    try {
      var response = await LawyersAPI().getProfile(id);
      InfoProfileModel result = InfoProfileModel.fromJson(response);
      return result;
    } catch (e) {
      AppLogger.catchLog(e);
      rethrow;
    }
  }
}
