

import 'package:quickreels/app/data/datasource/dto/save_user_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';

abstract class UserDatasource {

  Future<UserDTO> findByUid(String uid);

  Future<void> save(SaveUserDTO user);

  Future<void> followUser(String uid, String followId);

  Future<List<UserDTO>> findByName(String username);

  Future<List<UserDTO>> findAllThatUserIsFollowingBy(String uid);

}