import 'package:get/get.dart';
import 'package:quickreels/app/features/favorites/controller/favorites_controller.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(
      () => FavoritesController(
          getAuthUserUidUseCase: Get.find(),
          findFavoritesReelsByUserUseCase: Get.find(),
          likeReelUseCase: Get.find()),
    );
  }
}
