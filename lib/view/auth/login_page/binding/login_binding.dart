import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/auth/login_page/controller/login_controller.dart';



class LoginBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => LoginController());
  }

}