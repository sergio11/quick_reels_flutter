import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/usecase/fetch_user_home_feed_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/like_reel_use_case.dart';
import 'package:quickreels/app/features/home/model/home_ui_data.dart';

class HomeController extends BaseController<HomeUiData> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final FetchUserHomeFeedUseCase fetchUserHomeFeedUseCase;
  final LikeReelUseCase likeReelUseCase;

  HomeController(
      {required this.getAuthUserUidUseCase,
      required this.fetchUserHomeFeedUseCase,
      required this.likeReelUseCase})
      : super(initialUiState: const HomeUiData());

  @override
  void onInit() {
    super.onInit();
    _fetchUserHomeFeed();
  }

  likeReel(String reelId) async {
    callUseCase(likeReelUseCase(LikeReelParams(reelId)),
        onComplete: (isSuccess) => _onLikeReelCompleted(reelId, isSuccess));
  }

  void _fetchUserHomeFeed() async {
    final authUserUuid = await getAuthUserUidUseCase(const DefaultParams());
    final reels = await fetchUserHomeFeedUseCase(const DefaultParams());
    updateState(uiData.copyWith(reels: reels, authUserUuid: authUserUuid));
  }

  void _onLikeReelCompleted(String reelId, bool isSuccess) {
    if (isSuccess) {
      int reelIndex = uiData.reels.indexWhere((reel) => reel.reelId == reelId);
      if (reelIndex != -1) {
        final authUserUuid = uiData.authUserUuid;
        final List<ReelBO> updatedReels = List.from(uiData.reels);
        bool isLiked = updatedReels[reelIndex].likes.contains(authUserUuid);
        if (!isLiked) {
          updatedReels[reelIndex].likes.add(authUserUuid);
        } else {
          updatedReels[reelIndex].likes.remove(authUserUuid);
        }
        updateState(uiData.copyWith(reels: updatedReels));
      }
    }
  }
}
