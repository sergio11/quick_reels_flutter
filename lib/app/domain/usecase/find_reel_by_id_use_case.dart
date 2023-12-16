import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class FindReelByIdUseCase extends BaseUseCase<ReelBO, FindReelByIdParams> {
  final ReelRepository reelRepository;

  FindReelByIdUseCase({required this.reelRepository});

  @override
  Future<ReelBO> call(FindReelByIdParams param) async {
    return await reelRepository.findById(param.reelUuid);
  }
}

class FindReelByIdParams extends Equatable {
  final String reelUuid;

  const FindReelByIdParams(this.reelUuid);

  @override
  List<Object> get props => [reelUuid];
}
