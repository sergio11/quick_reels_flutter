import 'package:get/get.dart';
import 'package:quickreels/app/features/comments/controllers/comment_controller.dart';

class CommentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentController>(
      () => CommentController(),
    );
  }
}
