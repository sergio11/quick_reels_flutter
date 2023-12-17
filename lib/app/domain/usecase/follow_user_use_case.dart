import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/domain/repository/user_repository.dart';

class FollowUserUseCase extends BaseUseCase<bool, FollowUserParams> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  FollowUserUseCase(
      {required this.authRepository, required this.userRepository});

  @override
  Future<bool> call(FollowUserParams param) async {
    final authUserUuid = await authRepository.getAuthUserUid();
    return await userRepository.followUser(authUserUuid, param.uid);
  }
}

class FollowUserParams extends Equatable {
  final String uid;

  const FollowUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}
