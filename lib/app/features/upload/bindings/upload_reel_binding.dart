import 'package:get/get.dart';
import 'package:quickreels/app/features/upload/controller/upload_reel_controller.dart';

class UploadReelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadReelController>(
      () => UploadReelController(
          publishReelUseCase: Get.find(),
          fetchGeolocationDetailsUseCase: Get.find()),
    );
  }
}
