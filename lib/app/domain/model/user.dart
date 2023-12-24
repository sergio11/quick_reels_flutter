
class UserBO {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List<String> followers;
  final List<String> following;
  final int likesCount;

  const UserBO({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
    required this.likesCount
  });

  int get followersCount => followers.length;

  int get followingCount => following.length;
}