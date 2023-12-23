import 'package:get/get.dart';
import 'package:quickreels/app/features/followers/controller/followers_controller.dart';

class FollowersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowersController>(
      () => FollowersController(
          getAuthUserUidUseCase: Get.find(),
          findFollowersByUserUseCase: Get.find(),
          followUserUseCase: Get.find(),
          findAllFollowedByUseCase: Get.find()),
    );
  }
}
