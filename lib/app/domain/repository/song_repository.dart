
import 'package:quickreels/app/domain/model/song.dart';

abstract class SongRepository {

  Future<SongBO> findById(String id);

  Future<Iterable<SongBO>> findAll();
}
