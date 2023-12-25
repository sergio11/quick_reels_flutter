import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class ShareReelUseCase extends BaseUseCase<bool, ShareReelParams> {
  final AuthRepository authRepository;
  final ReelRepository reelRepository;

  ShareReelUseCase(
      {required this.authRepository, required this.reelRepository});

  @override
  Future<bool> call(ShareReelParams param) async {
    final authUserUid = await authRepository.getAuthUserUid();
    return await reelRepository.share(
        reelId: param.reelId, userUid: authUserUid);
  }
}

class ShareReelParams extends Equatable {
  final String reelId;

  const ShareReelParams(this.reelId);

  @override
  List<Object> get props => [reelId];
}
