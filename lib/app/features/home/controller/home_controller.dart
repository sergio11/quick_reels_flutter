import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/usecase/fetch_user_home_feed_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/features/home/model/home_ui_data.dart';

class HomeController extends BaseController<HomeUiData> {
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final FetchUserHomeFeedUseCase fetchUserHomeFeedUseCase;

  HomeController(
      {required this.getAuthUserUidUseCase,
      required this.fetchUserHomeFeedUseCase})
      : super(initialUiState: const HomeUiData());

  @override
  void onInit() {
    super.onInit();
    _fetchUserHomeFeed();
  }

  likeReel(String reelId) async {}

  void _fetchUserHomeFeed() async {
    final authUserUuid = await getAuthUserUidUseCase(const DefaultParams());
    final reels = await fetchUserHomeFeedUseCase(const DefaultParams());
    updateState(uiData.copyWith(reels: reels, authUserUuid: authUserUuid));
  }
}
