import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/song.dart';
import 'package:quickreels/app/domain/repository/song_repository.dart';

class FindAllSongsUseCase extends BaseUseCase<Iterable<SongBO>, DefaultParams> {
  final SongRepository songRepository;

  FindAllSongsUseCase({required this.songRepository});

  @override
  Future<Iterable<SongBO>> call(DefaultParams param) async {
    return await songRepository.findAll();
  }
}
