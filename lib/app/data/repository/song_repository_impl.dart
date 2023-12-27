import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/song_dto.dart';
import 'package:quickreels/app/data/datasource/song_datasource.dart';
import 'package:quickreels/app/domain/model/failure.dart';
import 'package:quickreels/app/domain/model/song.dart';
import 'package:quickreels/app/domain/repository/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongDatasource songDatasource;
  final Mapper<SongDTO, SongBO> songBoMapper;

  SongRepositoryImpl(
      {required this.songDatasource, required this.songBoMapper});

  @override
  Future<Iterable<SongBO>> findAll() async {
    try {
      final songs = await songDatasource.findAll();
      return songs.map((e) => songBoMapper(e));
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }

  @override
  Future<SongBO> findById(String id) async {
    try {
      final songDTO = await songDatasource.findById(id);
      return songBoMapper(songDTO);
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }
}
