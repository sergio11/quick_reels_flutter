import 'package:equatable/equatable.dart';
import 'package:quickreels/domain/model/user.dart';
import 'package:quickreels/domain/repository/auth_repository.dart';
import 'package:quickreels/domain/usecase/base_use_case.dart';

class GetUserDetailsUseCase extends BaseUseCase<UserBO, GetUserDetailsParams> {
  final AuthRepository authRepository;

  GetUserDetailsUseCase({ required this.authRepository });

  @override
  Future<UserBO> call(GetUserDetailsParams param) async {
    return await authRepository.getUserDetails(userUid: param.uid);
  }
}

class GetUserDetailsParams extends Equatable {

  final String uid;

  const GetUserDetailsParams(this.uid);

  @override
  List<Object> get props => [uid];
}
