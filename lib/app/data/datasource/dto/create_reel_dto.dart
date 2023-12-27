class CreateReelDTO {
  final String authorUid;
  final String description;
  final String url;
  final List<String> tags;
  final String? placeInfo;
  final String songId;

  CreateReelDTO(
      {required this.authorUid,
      required this.description,
      required this.url,
      required this.tags,
      required this.songId,
      this.placeInfo});
}
