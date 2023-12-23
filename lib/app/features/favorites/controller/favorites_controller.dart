import 'package:get/get.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/core/utils/reel_extensions.dart';
import 'package:quickreels/app/domain/usecase/find_favorites_reels_by_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/like_reel_use_case.dart';
import 'package:quickreels/app/features/favorites/model/favorites_ui_data.dart';

class FavoritesController extends BaseController<FavoritesUiState> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final FindFavoritesReelsByUserUseCase findFavoritesReelsByUserUseCase;
  final LikeReelUseCase likeReelUseCase;

  static const String USER_UUID_KEY = 'USER_UUID';

  FavoritesController(
      {required this.getAuthUserUidUseCase,
      required this.findFavoritesReelsByUserUseCase,
      required this.likeReelUseCase})
      : super(initialUiState: const FavoritesUiState());

  @override
  void onResumed() {
    _loadContent();
  }

  void _loadContent() async {
    final args = Get.arguments;
    if (args is Map<String, dynamic>? && args != null) {
      if (args.containsKey(USER_UUID_KEY)) {
        String? userUuid = args[USER_UUID_KEY] as String?;
        if (userUuid != null) {
          _loadFavoritesForUser(userUuid);
          return;
        }
      }
    }
    _loadCurrentUserDetails();
  }

  void likeReel(String reelUuid) async {
    callUseCase(likeReelUseCase(LikeReelParams(reelUuid)),
        onComplete: (isSuccess) => _onLikeReelCompleted(reelUuid, isSuccess));
  }

  void _onLikeReelCompleted(String reelId, bool isSuccess) {
    if (isSuccess) {
      final updatedReels =
          uiData.reels.updateLikes(reelId, uiData.userUuid, isSuccess);
      updateState(uiData.copyWith(reels: updatedReels), forceRefresh: true);
    }
  }

  void _loadCurrentUserDetails() async {
    final String authUserUid =
        await getAuthUserUidUseCase(const DefaultParams());
    _loadFavoritesForUser(authUserUid);
  }

  void _loadFavoritesForUser(String userUuid) async {
    callUseCase(
        findFavoritesReelsByUserUseCase(
            FindFavoritesReelsByUserParams(userUuid)), onSuccess: (reels) {
      updateState(uiData.copyWith(reels: reels));
    });
  }
}
