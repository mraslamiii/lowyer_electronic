import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/auth/login_page/controller/login_controller.dart';

import '../controller/verify_controller.dart';



class VerifyBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => VerifyController());
  }

}