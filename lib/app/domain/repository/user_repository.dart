import 'package:quickreels/app/domain/model/user.dart';

abstract class UserRepository {
  Future<bool> followUser(String uid, String followId);

  Future<UserBO> findByUid(String uid);

  Future<List<UserBO>> findByName(String username);

  Future<List<UserBO>> findAllFollowedBy(String uid);

  Future<List<UserBO>> findAllFollowersBy(String uid);
}
