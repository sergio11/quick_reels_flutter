import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/song_dto.dart';

class SongDtoMapper extends Mapper<DocumentSnapshot, SongDTO> {
  @override
  SongDTO call(DocumentSnapshot<Object?> object) {
    var snapshot = object.data() as Map<String, dynamic>;
    return SongDTO(
        songId: snapshot['songId'],
        name: snapshot['name'],
        url: snapshot['url'],
        tags: snapshot['tags'] is List
            ? List<String>.from(snapshot['tags'] as List)
            : []);
  }
}
