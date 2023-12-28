import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/model/song.dart';
import 'package:quickreels/app/domain/model/user.dart';

extension ReelListExtensions on List<ReelBO> {
  List<ReelBO> updateReaction(String reelId, String authUserUuid, bool isLikes) {
    final reelIndex = indexWhere((reel) => reel.reelId == reelId);
    if (reelIndex != -1) {
      final List<ReelBO> updatedReels = List.from(this);
      final List<String> reactions = isLikes ? updatedReels[reelIndex].likes : updatedReels[reelIndex].shares;
      final isReacted = reactions.contains(authUserUuid);
      if (!isReacted) {
        reactions.add(authUserUuid);
      } else {
        reactions.remove(authUserUuid);
      }
      return updatedReels;
    }
    return this;
  }
}

extension UserListExtensions on List<UserBO> {
  List<UserBO> updateFollowers(String userUuid, String authUserUuid) {
    final userIndex = indexWhere((user) => user.uid == userUuid);
    if (userIndex != -1) {
      final List<UserBO> updatedUsers = List.from(this);
      final List<String> followers = updatedUsers[userIndex].followers;
      final isFollowedBy = followers.contains(authUserUuid);
      if (!isFollowedBy) {
        followers.add(authUserUuid);
      } else {
        followers.remove(authUserUuid);
      }
      return updatedUsers;
    }
    return this;
  }
}

extension SongListExtensions on Iterable<SongBO> {
  String findSongNameById(String songId) =>
      firstWhere((song) => song.songId == songId, orElse: () => first).name;

  String findSongIdByName(String songName) =>
      firstWhere((song) => song.name.toLowerCase() == songName.toLowerCase(),
          orElse: () => first).songId;
}

extension StringExtensions on String {
  String getFileExtension() {
    int dotIndex = lastIndexOf('.');
    if (dotIndex != -1 && dotIndex < length - 1) {
      return substring(dotIndex + 1);
    }
    return '';
  }
}