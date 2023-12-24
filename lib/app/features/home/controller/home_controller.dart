import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/core/utils/reel_extensions.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/usecase/fetch_user_home_feed_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/like_reel_use_case.dart';
import 'package:quickreels/app/features/home/model/home_ui_data.dart';
import 'dart:async';

class HomeController extends BaseController<HomeUiData> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final FetchUserHomeFeedUseCase fetchUserHomeFeedUseCase;
  final LikeReelUseCase likeReelUseCase;
  late PageController pageController;
  late Timer _timer;

  HomeController(
      {required this.getAuthUserUidUseCase,
      required this.fetchUserHomeFeedUseCase,
      required this.likeReelUseCase})
      : super(initialUiState: const HomeUiData());

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0, viewportFraction: 1);
  }

  @override
  void onClose() {
    _timer.cancel();
    pageController.dispose();
    super.onClose();
  }

  @override
  void onResumed() {
    _fetchUserHomeFeed();
    _startTimerForNextReel();
  }

  @override
  void onPaused() {
    _timer.cancel();
  }

  likeReel(String reelId) async {
    callUseCase(likeReelUseCase(LikeReelParams(reelId)),
        onComplete: (isSuccess) => _onLikeReelCompleted(reelId, isSuccess));
  }

  void _nextReel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentIndex = pageController.page?.round() ?? 0;
      if (currentIndex < uiData.reels.length - 1) {
        pageController.animateToPage(currentIndex + 1,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  void _fetchUserHomeFeed() async {
    final authUserUuid = getAuthUserUidUseCase(const DefaultParams());
    final reels = fetchUserHomeFeedUseCase(const DefaultParams());
    callUseCase(Future.wait([authUserUuid, reels]),
        onSuccess: _handleUserHomeFeed);
  }

  void _handleUserHomeFeed(List result) async {
    final String authUserUuid = result.elementAtOrNull(0) is String
        ? result.elementAtOrNull(0) as String
        : "";
    final List<ReelBO> reels = result.elementAtOrNull(1) is List<ReelBO>
        ? result.elementAtOrNull(1) as List<ReelBO>
        : List.empty();

    updateState(uiData.copyWith(reels: reels, authUserUuid: authUserUuid));
  }

  void _onLikeReelCompleted(String reelId, bool isSuccess) {
    if (isSuccess) {
      final authUserUuid = uiData.authUserUuid;
      final updatedReels = uiData.reels.updateLikes(reelId, authUserUuid, isSuccess);
      updateState(uiData.copyWith(reels: updatedReels), forceRefresh: true);
    }
  }

  void _startTimerForNextReel() {
    _timer = Timer.periodic(const Duration(seconds: 20), (_) {
      _nextReel();
    });
  }
}
