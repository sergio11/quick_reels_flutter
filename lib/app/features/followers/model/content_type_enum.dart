
enum ContentTypeEnum {
  followers, following
}

extension ParseToString on String {
  ContentTypeEnum toContentTypeEnum() {
    return ContentTypeEnum.values.firstWhere(
          (e) => e.toString().split('.').last.toLowerCase() == toLowerCase(),
      orElse: () => ContentTypeEnum.followers,
    );
  }
}