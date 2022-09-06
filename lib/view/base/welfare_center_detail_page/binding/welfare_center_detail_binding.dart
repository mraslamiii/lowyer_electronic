import 'package:get/get.dart';
import '../controller/welfare_center_detail_controller.dart';

class WelfareCenterDetailBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => WelfareCenterDetailController());
  }

}