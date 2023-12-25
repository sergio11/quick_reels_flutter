class ReelDTO {
  final String reelId;
  final String description;
  final String authorUid;
  final DateTime datePublished;
  final String songId;
  final String url;
  final List<String> likes;
  final List<String> shares;
  final int commentCount;
  final int likesCount;
  final int sharesCount;
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
      required this.likesCount,
      required this.shares,
      required this.commentCount,
      required this.sharesCount,
      required this.tags,
      this.placeInfo});
}
