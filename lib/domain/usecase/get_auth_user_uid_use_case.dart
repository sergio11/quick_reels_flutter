import 'package:quickreels/domain/repository/auth_repository.dart';

import 'base_use_case.dart';

class GetAuthUserUidUseCase extends BaseUseCase<String, DefaultParams>{

  final AuthRepository authRepository;

  GetAuthUserUidUseCase({required this.authRepository});

  @override
  Future<String> call(DefaultParams param) async {
    return await authRepository.getAuthUserUid();
  }

}