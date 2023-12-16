import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/repository/user_repository.dart';

class FindFollowersByUserUseCase
    extends BaseUseCase<List<UserBO>, FindFollowersByUserParams> {
  final UserRepository userRepository;

  FindFollowersByUserUseCase({required this.userRepository});

  @override
  Future<List<UserBO>> call(FindFollowersByUserParams param) async {
    return await userRepository.findAllFollowersBy(param.uid);
  }
}

class FindFollowersByUserParams extends Equatable {
  final String uid;

  const FindFollowersByUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}
