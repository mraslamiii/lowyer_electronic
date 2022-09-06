import 'package:get/get.dart';

import '../controller/scan_search_controller.dart';


class ScanSearchBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => ScanSearchController());
  }

}