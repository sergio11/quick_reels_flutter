import 'package:get/get.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/core/utils/app_event_bus.dart';
import 'package:quickreels/app/features/shared/events/events.dart';

class AppController extends GetxController {

  final AppEventBus eventBus;
  final GetAuthUserUidUseCase getAuthUserUidUseCase;

  AppController({ required this.getAuthUserUidUseCase, required this.eventBus });

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  @override
  void onInit() {
    checkAuthStatus();
    ever(eventBus.events, (event) {
      if (event is SignInEvent) {
        _isAuthenticated = true;
      } else if (event is SignOutEvent) {
        _isAuthenticated = false;
      }
    });
    super.onInit();
  }

  void checkAuthStatus() async {
    try {
      print("checkAuthStatus CALLED!");
      final authUserUuid = await getAuthUserUidUseCase(const DefaultParams());
      _isAuthenticated = authUserUuid.isNotEmpty;
      print("_isAuthenticated -> $_isAuthenticated");
    } catch (e) {
      print("catch $e - _isAuthenticated -> $_isAuthenticated");
      _isAuthenticated = false;
    }
  }
}