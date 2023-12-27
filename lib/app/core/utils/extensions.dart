import 'package:quickreels/app/domain/model/reel.dart';

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

extension FileExtensionValidation on String {
  bool isValidVideoExtension() {
    final validExtensions = ['.mp4', '.mov'];
    return validExtensions.contains(toLowerCase());
  }
}