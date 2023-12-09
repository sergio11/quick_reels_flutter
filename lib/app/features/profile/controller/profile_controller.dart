import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/features/profile/model/profile_ui_data.dart';

class ProfileController extends BaseController<ProfileUiData> {

  ProfileController() : super(initialUiState: const ProfileUiData());

  @override
  void onReady() {
    super.onReady();
  }
}