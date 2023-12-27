
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/create_reel_dto.dart';
import 'package:uuid/uuid.dart';

class SaveReelDtoMapper extends Mapper<CreateReelDTO, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(CreateReelDTO object) {
    return {
      "description": object.description,
      "reelId": const Uuid().v1(),
      "likes": [],
      "shares": [],
      "commentsCount": 0,
      "likesCount": 0,
      "sharesCount": 0,
      "authorUid": object.authorUid,
      "datePublished": DateTime.now(),
      'url': object.url,
      "tags": object.tags,
      "placeInfo": object.placeInfo
    };
  }
}