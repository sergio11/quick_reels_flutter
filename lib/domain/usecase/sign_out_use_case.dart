
import 'package:quickreels/domain/repository/auth_repository.dart';
import 'package:quickreels/domain/usecase/base_use_case.dart';

class SignOutUseCase extends BaseUseCase<bool, DefaultParams> {
  final AuthRepository authRepository;

  SignOutUseCase({ required this.authRepository });

  @override
  Future<bool> call(DefaultParams param) async {
    return await authRepository.signOut();
  }
}