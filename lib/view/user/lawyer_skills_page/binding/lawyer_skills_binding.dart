import 'package:get/get.dart';
import '../controller/lawyer_skills_controller.dart';


class LawyerSkillsBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashUseCase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => LawyerSkillsController());
  }

}