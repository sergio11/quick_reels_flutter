import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class LikeReelUseCase extends BaseUseCase<bool, LikeReelParams> {

  final AuthRepository authRepository;
  final ReelRepository reelRepository;

  LikeReelUseCase({
    required this.authRepository,
    required this.reelRepository
  });

  @override
  Future<bool> call(LikeReelParams param) async {
    final authUserUid = await authRepository.getAuthUserUid();
    return await reelRepository.like(reelId: param.reelId, userUid: authUserUid);
  }
}

class LikeReelParams extends Equatable {

  final String reelId;

  const LikeReelParams(this.reelId);

  @override
  List<Object> get props => [reelId];
}