import 'package:get/get.dart';

import '../controller/edit_profile_controller.dart';


class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => EditProfileController());
  }

}