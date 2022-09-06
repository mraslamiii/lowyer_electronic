import 'package:get/get.dart';

import '../controller/lawyer_upload_image_controller.dart';


class LawyerUploadImageBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => LawyerUploadImageController());
  }

}