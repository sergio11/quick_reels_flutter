import 'package:get/get.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_user_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/sign_out_use_case.dart';
import 'package:quickreels/app/features/profile/model/profile_ui_data.dart';

class ProfileController extends BaseController<ProfileUiData> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final SignOutUseCase signOutUseCase;
  final GetUserDetailsUseCase getUserDetailsUseCase;

  static const String USER_UUID_KEY = 'USER_UUID';

  ProfileController(
      {required this.getAuthUserUidUseCase,
      required this.signOutUseCase,
      required this.getUserDetailsUseCase})
      : super(initialUiState: const ProfileUiData());

  @override
  void onInit() {
    super.onInit();
    Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      if (args.containsKey(USER_UUID_KEY)) {
        String? userUuid = args[USER_UUID_KEY] as String?;
        if (userUuid != null) {
          _loadUserDetails(userUuid);
          return;
        }
      }
    }
    _loadCurrentUserDetails();
  }

  void signOut() async {

  }

  void followUser() async {}

  void _loadUserDetails(String userUuid) async {
    try {
      final String authUserUid =
          await getAuthUserUidUseCase(const DefaultParams());
      final userDetails =
          await getUserDetailsUseCase(GetUserDetailsParams(userUuid));
      updateState(uiData.copyWith(
          userData: userDetails,
          userUuid: userUuid,
          isAuthUser: authUserUid == userUuid));
    } catch (e) {
      showErrorMessage("An error occurred while loading user details");
    }
  }

  void _loadCurrentUserDetails() async {
    try {
      final String authUserUid =
          await getAuthUserUidUseCase(const DefaultParams());
      final userDetails =
          await getUserDetailsUseCase(GetUserDetailsParams(authUserUid));
      updateState(uiData.copyWith(
          userData: userDetails, userUuid: authUserUid, isAuthUser: true));
    } catch (e) {
      showErrorMessage("An error occurred while loading user details");
    }
  }
}
