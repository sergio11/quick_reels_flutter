import 'package:equatable/equatable.dart';
import 'package:quickreels/domain/repository/auth_repository.dart';
import 'package:quickreels/domain/usecase/base_use_case.dart';

class SignInUserUseCase extends BaseUseCase<bool, SignInParams>{

  final AuthRepository authRepository;

  SignInUserUseCase({ required this.authRepository});

  @override
  Future<bool> call(SignInParams param) async {
    return await authRepository.signInUser(email: param.email, password: param.password);
  }

}

class SignInParams extends Equatable {

  final String email;
  final String password;

  const SignInParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}