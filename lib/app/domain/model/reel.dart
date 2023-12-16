class ReelBO {
  final String description;
  final String username;
  final String songName;
  final List<String> likes;
  final List<String> bookmarks;
  final String reelId;
  final String authorUid;
  final DateTime datePublished;
  final String url;
  final String authImageUrl;
  final int commentCount;
  final int shareCount;
  final List<String> tags;
  final String? placeInfo;

  const ReelBO(
      {required this.description,
      required this.songName,
      required this.username,
      required this.likes,
      required this.bookmarks,
      required this.reelId,
      required this.authorUid,
      required this.datePublished,
      required this.url,
      required this.authImageUrl,
      required this.commentCount,
      required this.shareCount,
      required this.tags,
      this.placeInfo});
}
