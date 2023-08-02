

import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/domain/model/user.dart';

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