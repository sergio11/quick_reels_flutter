import 'package:get/get.dart';
import 'package:quickreels/app/features/discover/controllers/discover_controller.dart';

class DiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoverController>(
      () => DiscoverController(),
    );
  }
}
