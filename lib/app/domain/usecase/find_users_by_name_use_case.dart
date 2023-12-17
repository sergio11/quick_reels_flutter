import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/repository/user_repository.dart';

class FindUsersByNameUseCase
    extends BaseUseCase<List<UserBO>, FindUsersByNameParams> {
  final UserRepository userRepository;

  FindUsersByNameUseCase({required this.userRepository});

  @override
  Future<List<UserBO>> call(FindUsersByNameParams param) async {
    return await userRepository.findByName(param.username);
  }
}

class FindUsersByNameParams extends Equatable {
  final String username;

  const FindUsersByNameParams(this.username);

  @override
  List<Object> get props => [username];
}
