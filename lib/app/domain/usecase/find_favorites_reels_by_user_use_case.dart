import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class FindFavoritesReelsByUserUseCase
    extends BaseUseCase<List<ReelBO>, FindFavoritesReelsByUserParams> {
  final ReelRepository reelRepository;

  FindFavoritesReelsByUserUseCase({required this.reelRepository});

  @override
  Future<List<ReelBO>> call(FindFavoritesReelsByUserParams param) async {
    return await reelRepository
        .findAllFavoritesByUserUidOrderByDatePublished(param.uid);
  }
}

class FindFavoritesReelsByUserParams extends Equatable {
  final String uid;

  const FindFavoritesReelsByUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}
