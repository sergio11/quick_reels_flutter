import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/core/utils/extensions.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/usecase/fetch_user_home_feed_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/like_reel_use_case.dart';
import 'package:quickreels/app/domain/usecase/share_reel_use_case.dart';
import 'package:quickreels/app/features/home/model/home_ui_data.dart';
import 'dart:async';

class HomeController extends BaseController<HomeUiData> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final FetchUserHomeFeedUseCase fetchUserHomeFeedUseCase;
  final LikeReelUseCase likeReelUseCase;
  final ShareReelUseCase shareReelUseCase;
  late PageController pageController;
  Timer? _timer;

  static const int NEXT_REEL_TIME_IN_SECONDS = 20;

  HomeController(
      {required this.getAuthUserUidUseCase,
      required this.fetchUserHomeFeedUseCase,
      required this.likeReelUseCase,
      required this.shareReelUseCase})
      : super(initialUiState: const HomeUiData());

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    pageController.addListener(() {
      print("pageController listener called!");
      _restartTimerForNextReel();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }

  @override
  void onResumed() {
    _fetchUserHomeFeed();
    _restartTimerForNextReel();
  }

  @override
  void onPaused() {
    _timer?.cancel();
  }

  void likeReel(String reelId) async {
    callUseCase(likeReelUseCase(LikeReelParams(reelId)),
        onComplete: (isSuccess) => _onLikeReelCompleted(reelId, isSuccess));
  }

  void shareReel(String reelId) async {
    callUseCase(shareReelUseCase(ShareReelParams(reelId)),
        onComplete: (isSuccess) => _onShareReelCompleted(reelId, isSuccess));
  }

  void _nextReel() {
    if (pageController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentIndex = pageController.page?.round() ?? 0;
        if (currentIndex < uiData.reels.length - 1) {
          pageController.animateToPage(
            currentIndex + 1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
      });
    }
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
      final updatedReels =
          uiData.reels.updateReaction(reelId, uiData.authUserUuid, true);
      updateState(uiData.copyWith(reels: updatedReels), forceRefresh: true);
    }
  }

  void _onShareReelCompleted(String reelId, bool isSuccess) {
    if (isSuccess) {
      final updatedReels =
      uiData.reels.updateReaction(reelId, uiData.authUserUuid, false);
      updateState(uiData.copyWith(reels: updatedReels), forceRefresh: true);
    }
  }

  void _startTimerForNextReel() {
    _timer = Timer.periodic(const Duration(seconds: NEXT_REEL_TIME_IN_SECONDS), (_) {
      _nextReel();
    });
  }

  void _restartTimerForNextReel() {
    print("_restartTimerForNextReel called!");
    _timer?.cancel();
    _startTimerForNextReel();
  }
}
