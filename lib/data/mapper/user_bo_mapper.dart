import 'package:quickreels/data/datasource/dto/user_dto.dart';
import 'package:quickreels/domain/model/user.dart';
import 'package:quickreels/utils/mapper.dart';

class UserBoMapper extends Mapper<UserDTO, UserBO> {
  @override
  UserBO call(UserDTO object) {
    return UserBO(
        username: object.username,
        uid: object.uid,
        photoUrl: object.photoUrl,
        email: object.email,
        bio: object.bio,
        followers: object.followers,
        following: object.following
    );
  }
}