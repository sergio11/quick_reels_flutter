import 'package:get/get.dart';
import 'package:quickreels/app/features/comments/controller/comments_controller.dart';

class CommentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentsController>(
      () => CommentsController(
          publishCommentUseCase: Get.find(),
          findAllCommentsByReelUseCase: Get.find(),
          getAuthUserUidUseCase: Get.find(),
          getUserDetailsUseCase: Get.find()),
    );
  }
}
