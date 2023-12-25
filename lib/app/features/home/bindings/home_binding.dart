import 'package:get/get.dart';
import 'package:quickreels/app/features/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
          fetchUserHomeFeedUseCase: Get.find(),
          getAuthUserUidUseCase: Get.find(),
          likeReelUseCase: Get.find(),
          shareReelUseCase: Get.find()),
    );
  }
}
