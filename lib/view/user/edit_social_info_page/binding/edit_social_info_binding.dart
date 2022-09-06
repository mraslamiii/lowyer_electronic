import 'package:get/get.dart';

import '../controller/edit_social_info_controller.dart';


class EditSocialInfoBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => EditSocialInfoController());
  }

}