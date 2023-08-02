

import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';

class SignOutUseCase extends BaseUseCase<bool, DefaultParams> {
  final AuthRepository authRepository;

  SignOutUseCase({ required this.authRepository });

  @override
  Future<bool> call(DefaultParams param) async {
    return await authRepository.signOut();
  }
}