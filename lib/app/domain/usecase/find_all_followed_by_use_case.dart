import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/repository/user_repository.dart';

class FindAllFollowedByUseCase
    extends BaseUseCase<List<UserBO>, FindAllFollowedByParams> {
  final UserRepository userRepository;

  FindAllFollowedByUseCase({required this.userRepository});

  @override
  Future<List<UserBO>> call(FindAllFollowedByParams param) async {
    return await userRepository.findAllFollowedBy(param.uid);
  }
}

class FindAllFollowedByParams extends Equatable {
  final String uid;

  const FindAllFollowedByParams(this.uid);

  @override
  List<Object> get props => [uid];
}
