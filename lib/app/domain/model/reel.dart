class ReelBO {
  final String description;
  final String username;
  final String songName;
  final String songUrl;
  final List<String> likes;
  final List<String> shares;
  final String reelId;
  final String authorUid;
  final DateTime datePublished;
  final String url;
  final String authImageUrl;
  final int commentCount;
  final int likesCount;
  final int sharesCount;
  final List<String> tags;
  final String? placeInfo;

  const ReelBO(
      {required this.description,
      required this.songName,
      required this.songUrl,
      required this.username,
      required this.likes,
      required this.shares,
      required this.reelId,
      required this.authorUid,
      required this.datePublished,
      required this.url,
      required this.authImageUrl,
      required this.commentCount,
      required this.likesCount,
      required this.sharesCount,
      required this.tags,
      this.placeInfo});
}
