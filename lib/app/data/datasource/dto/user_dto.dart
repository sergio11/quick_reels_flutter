class UserDTO {
  final String uid;
  final String username;
  final String email;
  final String photoUrl;
  final String bio;
  final List<String> followers;
  final List<String> following;
  final int likesCount;

  UserDTO(
      {required this.uid,
      required this.email,
      required this.photoUrl,
      required this.username,
      required this.bio,
      required this.followers,
      required this.following,
      required this.likesCount});

  UserDTO copyWith({
    String? uid,
    String? username,
    String? email,
    String? photoUrl,
    String? bio,
    List<String>? followers,
    List<String>? following,
    int? likesCount,
  }) {
    return UserDTO(
        uid: uid ?? this.uid,
        username: username ?? this.username,
        email: email ?? this.email,
        photoUrl: photoUrl ?? this.photoUrl,
        bio: bio ?? this.bio,
        followers: followers ?? this.followers,
        following: following ?? this.following,
        likesCount: likesCount ?? this.likesCount);
  }
}
