import 'package:get/get.dart';
import 'package:quickreels/app/features/discover/controller/discover_content_controller.dart';

class DiscoverContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoverContentController>(
      () => DiscoverContentController(
          getAuthUserUidUseCase: Get.find(),
          findUsersByNameUseCase: Get.find(),
          findReelsOrderByDatePublishedUseCase: Get.find(),
          followUserUseCase: Get.find()),
    );
  }
}