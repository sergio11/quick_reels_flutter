import 'package:quickreels/app/data/datasource/dto/song_dto.dart';

abstract class SongDatasource {
  Future<SongDTO> findById(String id);

  Future<List<SongDTO>> findAll();
}
