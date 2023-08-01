import 'package:flutter/foundation.dart';
import 'package:quickreels/data/datasource/dto/user_dto.dart';
import 'package:quickreels/data/datasource/user_datasource.dart';
import 'package:quickreels/domain/model/failure.dart';
import 'package:quickreels/domain/model/user.dart';
import 'package:quickreels/domain/repository/user_repository.dart';
import 'package:quickreels/utils/mapper.dart';

class UserRepositoryImpl implements UserRepository {

  final UserDatasource userDatasource;
  final Mapper<UserDTO, UserBO> userBoMapper;

  UserRepositoryImpl({
    required this.userDatasource,
    required this.userBoMapper
  });

  @override
  Future<bool> followUser(String uid, String followId) async {
    try {
      await userDatasource.followUser(uid, followId);
      return true;
    } catch (ex) {
      debugPrint("followUser - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<UserBO> findByUid(String uid) async {
     try {
       final user = await userDatasource.findByUid(uid);
       return userBoMapper(user);
     } catch (ex) {
       debugPrint("findByUid - ex -> ${ex.toString()}");
       throw Failure(message: ex.toString());
     }
  }

  @override
  Future<List<UserBO>> findByName(String username) async {
    try {
      final userList = await userDatasource.findByName(username);
      return userList.map((e) => userBoMapper(e)).toList();
    } catch (ex) {
      debugPrint("findByName - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<List<UserBO>> findAllThatUserIsFollowingBy(String uid) async {
    try {
      final userList = await userDatasource.findAllThatUserIsFollowingBy(uid);
      return userList.map((e) => userBoMapper(e)).toList();
    } catch (ex) {
      debugPrint("findAllThatUserIsFollowingBy - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }
}
