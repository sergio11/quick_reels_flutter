import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';


class GetAuthUserUidUseCase extends BaseUseCase<String, DefaultParams>{

  final AuthRepository authRepository;

  GetAuthUserUidUseCase({required this.authRepository});

  @override
  Future<String> call(DefaultParams param) async {
    return await authRepository.getAuthUserUid();
  }
}