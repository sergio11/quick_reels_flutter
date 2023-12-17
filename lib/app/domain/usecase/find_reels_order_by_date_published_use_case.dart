import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class FindReelsOrderByDatePublishedUseCase
    extends BaseUseCase<List<ReelBO>, DefaultParams> {
  final ReelRepository reelRepository;

  FindReelsOrderByDatePublishedUseCase({required this.reelRepository});

  @override
  Future<List<ReelBO>> call(DefaultParams param) async {
    return await reelRepository.findAllOrderByDatePublished();
  }
}
