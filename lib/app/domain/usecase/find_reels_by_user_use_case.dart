import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class FindReelsByUserUseCase
    extends BaseUseCase<List<ReelBO>, FindReelsByUserParams> {
  final ReelRepository reelRepository;

  FindReelsByUserUseCase({required this.reelRepository});

  @override
  Future<List<ReelBO>> call(FindReelsByUserParams param) async {
    return await reelRepository.findAllByUserUidOrderByDatePublished(param.uid);
  }
}

class FindReelsByUserParams extends Equatable {
  final String uid;

  const FindReelsByUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}
