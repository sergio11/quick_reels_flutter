import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/comment_dto.dart';

class CommentDtoMapper extends Mapper<DocumentSnapshot, CommentDTO> {
  @override
  CommentDTO call(DocumentSnapshot<Object?> object) {
    var snapshot = object.data() as Map<String, dynamic>;
    return CommentDTO(
        commentId: snapshot['commentId'],
        reelId: snapshot['reelId'],
        text: snapshot['text'],
        authorUid: snapshot['authorUid'],
        datePublished: (snapshot['datePublished'] as Timestamp).toDate());
  }
}