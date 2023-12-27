import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/reel_dto.dart';

class ReelDtoMapper extends Mapper<DocumentSnapshot, ReelDTO> {
  @override
  ReelDTO call(DocumentSnapshot<Object?> object) {
    var snapshot = object.data() as Map<String, dynamic>;
    return ReelDTO(
        reelId: snapshot['reelId'],
        description: snapshot['description'],
        authorUid: snapshot['authorUid'],
        datePublished: (snapshot['datePublished'] as Timestamp).toDate(),
        url: snapshot['url'],
        likes: snapshot['likes'] is List
            ? List<String>.from(snapshot['likes'] as List)
            : [],
        likesCount: snapshot['likesCount'] is int ? snapshot['likesCount'] : 0,
        shares: snapshot['shares'] is List
            ? List<String>.from(snapshot['shares'] as List)
            : [],
        commentCount:
            snapshot['commentsCount'] is int ? snapshot['commentsCount'] : 0,
        sharesCount:
            snapshot['sharesCount'] is int ? snapshot['sharesCount'] : 0,
        tags: snapshot['tags'] is List
            ? List<String>.from(snapshot['tags'] as List)
            : [],
        placeInfo: snapshot['placeInfo'],
        songId: snapshot['songId']);
  }
}
