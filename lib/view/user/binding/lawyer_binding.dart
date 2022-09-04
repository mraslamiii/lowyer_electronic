import 'package:get/get.dart';

import '../controller/lawyer_controller.dart';



class LawyerBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => LawyerController());
  }

}