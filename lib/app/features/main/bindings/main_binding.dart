import 'package:get/get.dart';
import 'package:quickreels/app/features/main/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}
