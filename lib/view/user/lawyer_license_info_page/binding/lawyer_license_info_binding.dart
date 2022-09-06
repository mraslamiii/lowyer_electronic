import 'package:get/get.dart';

import '../controller/lawyer_license_info_controller.dart';


class LawyerLicenseInfoBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => LawyerLicenseInfoController());
  }

}