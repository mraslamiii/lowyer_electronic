import 'package:get/get.dart';

import '../../models/sec/info_profile_model.dart';
import '../../service/preferences_service.dart';
import '../../web_providers/sec/lawyer_provider.dart';

class SplashRepository {
  Future<bool> syncApp() async {
    var a = fetchUser();

    var futures = <Future>[a];
    await Future.wait(futures);

    return Future.value(true);
  }
  Future<InfoProfileModel> fetchUser() async {
    final LocalStorageService pref = Get.find<LocalStorageService>();
    try {
      var response = await LawyersAPI().getProfile(pref.user.lawyerProfile.toString());
      InfoProfileModel result =  InfoProfileModel.fromJson(response);
      pref.setLawyer(response);
      return  result ;
    } catch (e) {
      rethrow;
    }
  }
}
