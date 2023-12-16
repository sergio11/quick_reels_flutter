class ReelDTO {
  final String reelId;
  final String description;
  final String authorUid;
  final DateTime datePublished;
  final String songId;
  final String url;
  final List<String> likes;
  final List<String> bookmarks;
  final int commentCount;
  final int shareCount;
  final List<String> tags;
  final String? placeInfo;

  ReelDTO(
      {required this.reelId,
      required this.description,
      required this.authorUid,
      required this.datePublished,
      required this.songId,
      required this.url,
      required this.likes,
      required this.bookmarks,
      required this.commentCount,
      required this.shareCount,
      required this.tags,
      this.placeInfo});
}
