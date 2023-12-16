class SongDTO {
  final String songId;
  final String name;
  final String url;
  final List<String> tags;

  SongDTO(
      {required this.songId,
      required this.name,
      required this.url,
      required this.tags});
}
