import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/core/utils/app_event_bus.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/features/shared/events/events.dart';

class SignOutUseCase extends BaseUseCase<bool, DefaultParams> {
  final AuthRepository authRepository;
  final AppEventBus appEventBus;

  SignOutUseCase({required this.authRepository, required this.appEventBus});

  @override
  Future<bool> call(DefaultParams param) async {
    final isSuccess = await authRepository.signOut();
    appEventBus.sendEvent(SignOutEvent());
    return isSuccess;
  }
}
