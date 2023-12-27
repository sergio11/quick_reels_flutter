import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/song_dto.dart';
import 'package:quickreels/app/domain/model/song.dart';

class SongBoMapper extends Mapper<SongDTO, SongBO> {
  @override
  SongBO call(SongDTO object) {
    return SongBO(
        songId: object.songId,
        name: object.name,
        url: object.url,
        tags: object.tags);
  }
}
