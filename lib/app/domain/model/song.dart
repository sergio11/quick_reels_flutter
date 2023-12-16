class SongBO {
  final String songId;
  final String name;
  final String url;
  final List<String> tags;

  SongBO(
      {required this.songId,
      required this.name,
      required this.url,
      required this.tags});
}
