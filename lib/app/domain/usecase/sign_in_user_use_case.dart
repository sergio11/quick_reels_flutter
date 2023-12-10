import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/core/utils/app_event_bus.dart';
import 'package:quickreels/app/features/shared/events/events.dart';

class SignInUserUseCase extends BaseUseCase<bool, SignInParams>{

  final AuthRepository authRepository;
  final AppEventBus appEventBus;

  SignInUserUseCase({ required this.authRepository, required this.appEventBus});

  @override
  Future<bool> call(SignInParams param) async {
    final isSignIn = await authRepository.signInUser(email: param.email, password: param.password);
    if(isSignIn) {
      appEventBus.sendEvent(SignInEvent());
    }
    return isSignIn;
  }
}

class SignInParams extends Equatable {

  final String email;
  final String password;

  const SignInParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}