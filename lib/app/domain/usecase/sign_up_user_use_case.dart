import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/core/utils/app_event_bus.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/features/shared/events/events.dart';

class SignUpUserUseCase extends BaseUseCase<bool, SignUpParams> {
  final AuthRepository authRepository;
  final AppEventBus appEventBus;

  SignUpUserUseCase({required this.authRepository, required this.appEventBus});

  @override
  Future<bool> call(SignUpParams param) async {
    final isSuccess = await authRepository.signUpUser(
        email: param.email,
        password: param.password,
        username: param.username,
        bio: param.bio,
        file: param.file);
    if (isSuccess) {
      appEventBus.sendEvent(SignInEvent());
    }
    return isSuccess;
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String username;
  final String bio;
  final Uint8List file;

  const SignUpParams(
      this.email, this.password, this.username, this.bio, this.file);

  @override
  List<Object> get props => [email, password, username, bio, file];
}
