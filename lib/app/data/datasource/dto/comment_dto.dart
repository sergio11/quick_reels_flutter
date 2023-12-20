class CommentDTO {
  final String commentId;
  final String reelId;
  final String text;
  final String authorUid;
  final DateTime datePublished;

  CommentDTO(
      {required this.commentId,
      required this.reelId,
      required this.text,
      required this.authorUid,
      required this.datePublished});
}
