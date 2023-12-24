import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';

class UserDtoMapper extends Mapper<DocumentSnapshot, UserDTO> {
  @override
  UserDTO call(DocumentSnapshot<Object?> object) {
    var snapshot = object.data() as Map<String, dynamic>;
    return UserDTO(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      followers: snapshot['followers'] is List
          ? List<String>.from(snapshot['followers'] as List)
          : [],
      following: snapshot['following'] is List
          ? List<String>.from(snapshot['following'] as List)
          : [],
      likesCount: snapshot['likeCount'] is int ? snapshot['likeCount'] : 0,
    );
  }
}
