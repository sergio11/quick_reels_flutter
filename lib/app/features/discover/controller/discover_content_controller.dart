import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/usecase/find_reels_order_by_date_published_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_users_by_name_use_case.dart';
import 'package:quickreels/app/domain/usecase/follow_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/features/discover/model/discover_content_ui_data.dart';

class DiscoverContentController extends BaseController<DiscoverContentUiState> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final FindUsersByNameUseCase findUsersByNameUseCase;
  final FindReelsOrderByDatePublishedUseCase
      findReelsOrderByDatePublishedUseCase;
  final FollowUserUseCase followUserUseCase;

  late TextEditingController searchController;

  DiscoverContentController(
      {required this.getAuthUserUidUseCase,
      required this.findUsersByNameUseCase,
      required this.findReelsOrderByDatePublishedUseCase,
      required this.followUserUseCase})
      : super(initialUiState: const DiscoverContentUiState());

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    _onLoadLastPostsPublishedEventHandler();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void searchUsers(String term) async {
    if (term.isNotEmpty) {
      callUseCase(findUsersByNameUseCase(FindUsersByNameParams(term)),
          onSuccess: (users) =>
              updateState(uiData.copyWith(users: users, isShowUsers: true)),
          onError: (fail) =>
              updateState(uiData.copyWith(isShowUsers: false, users: [])));
    } else {
      updateState(uiData.copyWith(isShowUsers: false, users: []));
    }
    searchController.text = term;
  }

  void toggleFollowUser(String userUid) async {
    callUseCase(followUserUseCase(FollowUserParams(userUid)));
  }

  void _onLoadLastPostsPublishedEventHandler() async {
    final userAuthUuid = getAuthUserUidUseCase(const DefaultParams());
    final reels = findReelsOrderByDatePublishedUseCase(const DefaultParams());
    callUseCase(Future.wait([userAuthUuid, reels]),
        onSuccess: (result) => updateState(uiData.copyWith(
            authUserUuid: result[0] as String,
            reels: result[1] as List<ReelBO>,
            isShowUsers: false)));
  }
}
