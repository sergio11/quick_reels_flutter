import 'package:get/get.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/core/utils/extensions.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/usecase/find_all_followed_by_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_followers_by_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/follow_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/features/followers/model/content_type_enum.dart';
import 'package:quickreels/app/features/followers/model/followers_ui_data.dart';

class FollowersController extends BaseController<FollowersUiState> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final FindFollowersByUserUseCase findFollowersByUserUseCase;
  final FindAllFollowedByUseCase findAllFollowedByUseCase;
  final FollowUserUseCase followUserUseCase;

  static const String CONTENT_TYPE_KEY = 'CONTENT_TYPE';
  static const String USER_UUID_KEY = 'USER_UUID';

  FollowersController(
      {required this.getAuthUserUidUseCase,
      required this.findFollowersByUserUseCase,
      required this.findAllFollowedByUseCase,
      required this.followUserUseCase})
      : super(initialUiState: const FollowersUiState());

  @override
  void onInit() {
    super.onInit();
    Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      if (args.containsKey(USER_UUID_KEY) &&
          args.containsKey(CONTENT_TYPE_KEY)) {
        String? userUuid = args[USER_UUID_KEY] as String?;
        String? contentType = args[CONTENT_TYPE_KEY] as String?;
        if (userUuid != null && contentType != null) {
          updateState(uiData.copyWith(
              userUid: userUuid, contentType: contentType.toContentTypeEnum()));
          _loadContent();
        }
      }
    }
  }

  void refreshContent() {
    _loadContent();
  }

  void toggleFollowUser(String userUid) async {
    callUseCase(followUserUseCase(FollowUserParams(userUid)),
        onComplete: (isSuccess) => _onFollowUserCompleted(userUid, isSuccess));
  }

  void _loadContent() async {
    if (uiData.contentType == ContentTypeEnum.followers) {
      _loadFollowers(uiData.userUid);
    } else {
      _loadFollowing(uiData.userUid);
    }
  }

  void _loadFollowers(String userUid) async {
    final authUserUid = getAuthUserUidUseCase(const DefaultParams());
    final followers =
        findFollowersByUserUseCase(FindFollowersByUserParams(userUid));

    callUseCase(Future.wait([authUserUid, followers]),
        onSuccess: (result) => _onLoadUserCompleted(result));
  }

  void _loadFollowing(String userUid) async {
    final authUserUid = getAuthUserUidUseCase(const DefaultParams());
    final followedBy =
        findAllFollowedByUseCase(FindAllFollowedByParams(userUid));
    callUseCase(Future.wait([authUserUid, followedBy]),
        onSuccess: (result) => _onLoadUserCompleted(result));
  }

  void _onLoadUserCompleted(List result) {
    final String authUserUid = result.elementAtOrNull(0) is String
        ? result.elementAtOrNull(0) as String
        : "";
    final List<UserBO> users = result.elementAtOrNull(1) is List<UserBO>
        ? result.elementAtOrNull(1) as List<UserBO>
        : List.empty();
    updateState(uiData.copyWith(authUserUid: authUserUid, users: users));
  }

  void _onFollowUserCompleted(String userUid, bool isSuccess) {
    if (isSuccess) {
      updateState(
          uiData.copyWith(
              users: uiData.users.updateFollowers(userUid, uiData.authUserUid)),
          forceRefresh: true);
    }
  }
}
