import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class FindBookmarkReelsByUserUseCase
    extends BaseUseCase<List<ReelBO>, FindBookmarkReelsByUserParams> {
  final ReelRepository reelRepository;

  FindBookmarkReelsByUserUseCase({required this.reelRepository});

  @override
  Future<List<ReelBO>> call(FindBookmarkReelsByUserParams param) async {
    return await reelRepository
        .findAllBookmarkByUserUidOrderByDatePublished(param.uid);
  }
}

class FindBookmarkReelsByUserParams extends Equatable {
  final String uid;

  const FindBookmarkReelsByUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}
