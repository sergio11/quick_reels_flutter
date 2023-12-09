import 'package:get/get.dart';
import 'package:quickreels/app/features/profile/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(getAuthUserUidUseCase: Get.find(), signOutUseCase: Get.find(), getUserDetailsUseCase: Get.find()),
    );
  }
}
