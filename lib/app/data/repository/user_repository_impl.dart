import 'package:flutter/foundation.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/save_user_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/data/datasource/storage_datasource.dart';
import 'package:quickreels/app/data/datasource/user_datasource.dart';
import 'package:quickreels/app/domain/model/failure.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  static const String PROFILE_PICS_FOLDER_NAME = 'profilePics';

  final UserDatasource userDatasource;
  final StorageDatasource storageDatasource;
  final Mapper<UserDTO, UserBO> userBoMapper;

  UserRepositoryImpl(
      {required this.userDatasource,
      required this.storageDatasource,
      required this.userBoMapper});

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
  Future<List<UserBO>> findAllFollowedBy(String uid) async {
    try {
      final userList = await userDatasource.findAllFollowedBy(uid);
      return userList.map((e) => userBoMapper(e)).toList();
    } catch (ex) {
      debugPrint("findAllFollowedBy - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<List<UserBO>> findAllFollowersBy(String uid) async {
    try {
      final userList = await userDatasource.findAllFollowersBy(uid);
      return userList.map((e) => userBoMapper(e)).toList();
    } catch (ex) {
      debugPrint("findAllFollowersBy - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<UserBO> update(
      {required String uid,
      required String username,
      required String email,
      required Uint8List? file,
      required String bio}) async {
    try {
      final userCurrent = await userDatasource.findByUid(uid);
      final String userPhotoUrl = userCurrent.photoUrl;
      final String? newPhotoUrl = file != null
          ? await storageDatasource.uploadFileToStorage(
              folderName: PROFILE_PICS_FOLDER_NAME,
              id: uid,
              file: file,
            )
          : null;
      await userDatasource.save(SaveUserDTO(
          uid: uid,
          username: username,
          email: email,
          photoUrl: newPhotoUrl ?? userPhotoUrl,
          bio: bio));
      final updatedUser = userCurrent.copyWith(
          username: username,
          email: email,
          photoUrl: newPhotoUrl ?? userPhotoUrl,
          bio: bio);
      return userBoMapper(updatedUser);
    } catch (ex) {
      debugPrint("update - ex: $ex");
      throw Failure(message: ex.toString());
    }
  }
}
