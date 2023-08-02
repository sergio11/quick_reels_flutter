import 'package:get/get.dart';
import 'package:quickreels/app/features/video/controllers/video_controller.dart';

class VideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoController>(
      () => VideoController(),
    );
  }
}
