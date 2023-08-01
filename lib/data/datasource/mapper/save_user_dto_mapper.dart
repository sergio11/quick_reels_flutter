import 'package:quickreels/data/datasource/dto/save_user_dto.dart';
import 'package:quickreels/utils/mapper.dart';

class SaveUserDtoMapper extends Mapper<SaveUserDTO, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(SaveUserDTO object) {
    return {
      "username": object.username,
      "uid": object.uid,
      "email": object.email,
      "photoUrl": object.photoUrl,
      "bio": object.bio,
      "followers": 0,
      "following": 0,
    };
  }
}