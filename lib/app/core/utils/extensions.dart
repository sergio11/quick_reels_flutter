import 'package:quickreels/app/domain/model/reel.dart';
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

extension FileExtensionValidation on String {
  bool isValidVideoExtension() {
    final validExtensions = ['.mp4', '.mov'];
    return validExtensions.contains(toLowerCase());
  }
}