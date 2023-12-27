import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/save_reel_comment_dto.dart';
import 'package:uuid/uuid.dart';

class SaveReelCommentDTOMapper
    extends Mapper<SaveReelCommentDTO, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(SaveReelCommentDTO object) {
    return {
      'reelId': object.reelId,
      'authorUid': object.authorUid,
      'text': object.text,
      'commentId': const Uuid().v1(),
      'datePublished': DateTime.now()
    };
  }
}
