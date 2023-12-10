import 'package:get/get.dart';
import 'package:quickreels/app/features/signin/controllers/signin_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(signInUserUseCase: Get.find()),
    );
  }
}
