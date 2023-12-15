class UpdateReelDTO {
  final String postUuid;
  final String description;
  final List<String> tags;
  final String? placeInfo;

  UpdateReelDTO(
      {required this.postUuid,
      required this.description,
      required this.tags,
      required this.placeInfo});
}
