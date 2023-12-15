class SaveReelCommentDTO {
  final String reelId;
  final String text;
  final String authorUid;

  SaveReelCommentDTO({
    required this.reelId,
    required this.text,
    required this.authorUid,
  });
}
