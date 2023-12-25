import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/song_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/domain/model/reel.dart';

class ReelBoMapper extends Mapper<ReelBoMapperData, ReelBO> {
  @override
  ReelBO call(ReelBoMapperData object) {
    final reelDTO = object.reelDTO;
    final userDTO = object.userDTO;
    final songDTO = object.songDTO;
    return ReelBO(
      description: reelDTO.description,
      username: userDTO.username,
      likes: reelDTO.likes,
      shares: reelDTO.shares,
      reelId: reelDTO.reelId,
      datePublished: reelDTO.datePublished,
      url: reelDTO.url,
      authorUid: userDTO.uid,
      authImageUrl: userDTO.photoUrl,
      commentCount: reelDTO.commentCount,
      tags: reelDTO.tags,
      placeInfo: reelDTO.placeInfo,
      songName: songDTO.name,
      songUrl: songDTO.url,
      likesCount: reelDTO.likesCount,
      sharesCount: reelDTO.sharesCount,
    );
  }
}

class ReelBoMapperData {
  final ReelDTO reelDTO;
  final UserDTO userDTO;
  final SongDTO songDTO;

  ReelBoMapperData(
      {required this.reelDTO, required this.userDTO, required this.songDTO});
}
