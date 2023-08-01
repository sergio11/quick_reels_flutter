import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickreels/data/datasource/dto/user_dto.dart';
import 'package:quickreels/utils/mapper.dart';

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
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }
}