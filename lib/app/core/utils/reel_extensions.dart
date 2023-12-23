import 'package:quickreels/app/domain/model/reel.dart';

extension ReelListExtensions on List<ReelBO> {
  List<ReelBO> updateLikes(String reelId, String authUserUuid, bool isSuccess) {
    final reelIndex = indexWhere((reel) => reel.reelId == reelId);
    if (reelIndex != -1) {
      final List<ReelBO> updatedReels = List.from(this);
      final isLiked = updatedReels[reelIndex].likes.contains(authUserUuid);
      if (!isLiked && isSuccess) {
        updatedReels[reelIndex].likes.add(authUserUuid);
      } else if (isLiked && isSuccess) {
        updatedReels[reelIndex].likes.remove(authUserUuid);
      }
      return updatedReels;
    }
    return this;
  }
}