import 'package:get/get.dart';

import '../../models/lawyer/info_profile_model.dart';
import '../../service/preferences_service.dart';
import '../../web_providers/lawyer_provider/lawyer_provider.dart';

class SplashRepository {
  Future<bool> syncApp() async {
    var a = fetchUser();

    var futures = <Future>[a];
    await Future.wait(futures);

    return Future.value(true);
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
}

