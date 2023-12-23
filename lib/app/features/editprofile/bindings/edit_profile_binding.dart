import 'package:get/get.dart';
import 'package:quickreels/app/features/editprofile/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(
          getAuthUserUidUseCase: Get.find(),
          updateUserUseCase: Get.find(),
          getUserDetailsUseCase: Get.find()),
    );
  }
}
