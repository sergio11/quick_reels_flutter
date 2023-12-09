import 'package:get/get.dart';
import 'package:quickreels/app/features/signup/controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(signUpUserUseCase: Get.find(), appEventBus: Get.find()),
    );
  }
}
