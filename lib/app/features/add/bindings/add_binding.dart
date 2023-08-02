import 'package:get/get.dart';
import 'package:quickreels/app/features/add/controllers/upload_video_controller.dart';


class AddVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadVideoController>(
      () => UploadVideoController(),
    );
  }
}
