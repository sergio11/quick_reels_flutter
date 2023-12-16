import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/song_dto.dart';
import 'package:quickreels/app/data/datasource/song_datasource.dart';

class SongDataSourceImpl extends SongDatasource {
  final FirebaseFirestore firestore;
  final Mapper<DocumentSnapshot, SongDTO> songMapper;

  SongDataSourceImpl({required this.firestore, required this.songMapper});

  CollectionReference<Map<String, dynamic>> get _songCollection =>
      firestore.collection('songs');

  @override
  Future<List<SongDTO>> findAll() async {
    final songs = await _songCollection.get();
    return songs.docs.map((doc) => songMapper(doc)).toList();
  }

  @override
  Future<SongDTO> findById(String id) async {
    final docSnap = await _songCollection.doc(id).get();
    return songMapper(docSnap);
  }
}
