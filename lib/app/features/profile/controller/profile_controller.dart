import 'package:get/get.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/core/utils/reel_extensions.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/usecase/find_reels_by_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/follow_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_user_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/like_reel_use_case.dart';
import 'package:quickreels/app/domain/usecase/sign_out_use_case.dart';
import 'package:quickreels/app/features/profile/model/profile_ui_data.dart';

class ProfileController extends BaseController<ProfileUiData> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final SignOutUseCase signOutUseCase;
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final FindReelsByUserUseCase findReelsByUserUseCase;
  final FollowUserUseCase followUserUseCase;
  final LikeReelUseCase likeReelUseCase;

  static const String USER_UUID_KEY = 'USER_UUID';

  ProfileController(
      {required this.getAuthUserUidUseCase,
      required this.signOutUseCase,
      required this.getUserDetailsUseCase,
      required this.findReelsByUserUseCase,
      required this.followUserUseCase,
      required this.likeReelUseCase})
      : super(initialUiState: const ProfileUiData());

  @override
  void onResumed() {
    _loadContent();
  }

  void signOut() async {
    callUseCase(signOutUseCase(const DefaultParams()),
        onComplete: (_) => _handleSignOutCompleted());
  }

  void followUser() async {
    callUseCase(followUserUseCase(FollowUserParams(uiData.userUuid)));
  }

  void likeReel(String reelUuid) async {
    callUseCase(likeReelUseCase(LikeReelParams(reelUuid)),
        onComplete: (isSuccess) => _onLikeReelCompleted(reelUuid, isSuccess));
  }

  void _onLikeReelCompleted(String reelId, bool isSuccess) {
    if (isSuccess) {
      final updatedReels =
      uiData.reels.updateLikes(reelId, uiData.authUserUuid, isSuccess);
      updateState(uiData.copyWith(reels: updatedReels), forceRefresh: true);
    }
  }

  void _loadContent() async {
    final args = Get.arguments;
    if (args is Map<String, dynamic>? && args != null) {
      if (args.containsKey(USER_UUID_KEY)) {
        String? userUuid = args[USER_UUID_KEY] as String?;
        if (userUuid != null) {
          _loadScreenContentForUser(userUuid);
          return;
        }
      }
    }
    _loadScreenContentForUser(null);
  }

  void _loadScreenContentForUser(String? userUuid) async {
    final String authUserUid = await getAuthUserUidUseCase(const DefaultParams());
    final userDetails = getUserDetailsUseCase(GetUserDetailsParams(userUuid ?? authUserUid));
    final userReels = findReelsByUserUseCase(FindReelsByUserParams(userUuid ?? authUserUid));
    callUseCase(Future.wait([userDetails, userReels]), onSuccess: (result) {
      _handleLoadScreenContentForUser(result, userUuid ?? authUserUid, authUserUid);
    });
  }

  void _handleLoadScreenContentForUser(
      List result, String userUuid, String authUserUid) async {
    final UserBO? userDetails = result.elementAtOrNull(0) is UserBO
        ? result.elementAtOrNull(0) as UserBO
        : null;
    final List<ReelBO> userReels = result.elementAtOrNull(1) is List<ReelBO>
        ? result.elementAtOrNull(1) as List<ReelBO>
        : List.empty();

    updateState(uiData.copyWith(
        userData: userDetails,
        userUuid: userUuid,
        isAuthUser: userUuid == authUserUid,
        authUserUuid: authUserUid,
        reels: userReels));
  }

  void _handleSignOutCompleted() async {
    logoutController.value = true;
  }
}
