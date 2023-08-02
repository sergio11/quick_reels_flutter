import 'package:get/get.dart';
import 'package:quickreels/app/features/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(signUpUserUseCase: Get.find()),
    );
  }
}
