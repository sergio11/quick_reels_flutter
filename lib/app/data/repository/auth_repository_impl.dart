import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/auth_datasource.dart';
import 'package:quickreels/app/data/datasource/dto/save_user_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/data/datasource/storage_datasource.dart';
import 'package:quickreels/app/data/datasource/user_datasource.dart';
import 'package:quickreels/app/domain/model/failure.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  static const String PROFILE_PICS_FOLDER_NAME = 'profilePics';

  final AuthDatasource authDatasource;
  final UserDatasource userDatasource;
  final StorageDatasource storageDatasource;
  final Mapper<UserDTO, UserBO> userBoMapper;

  AuthRepositoryImpl({
    required this.authDatasource,
    required this.userDatasource,
    required this.storageDatasource,
    required this.userBoMapper
  });

  @override
  Future<UserBO> getUserDetails({
    required String userUid
  }) async {
    try {
      final user = await userDatasource.findByUid(userUid);
      return userBoMapper(user);
    } catch (ex) {
      debugPrint("getUserDetails - ex - ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<bool> signInUser({
    required String email,
    required String password
  }) async {
    try {
      // logging in user with email and password
      await authDatasource.signInUser(email: email, password: password);
      return true;
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await authDatasource.signOut();
      return true;
    } catch(err) {
      throw Failure(message: err.toString());
    }
  }

  @override
  Future<bool> signUpUser({
    required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file
  }) async {
    try {
      final userUid = await authDatasource.signUpUser(email: email, password: password);
      final userPhotoUrl = await storageDatasource.uploadFileToStorage(folderName: PROFILE_PICS_FOLDER_NAME, id: userUid, file: file);
      await userDatasource.save(SaveUserDTO(
          uid: userUid,
          username: username,
          email: email,
          photoUrl: userPhotoUrl,
          bio: bio
      ));
      return true;
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }


  @override
  Future<String> getAuthUserUid() async {
    try {
      return await authDatasource.getCurrentAuthUserUid();
    } catch (ex) {
      debugPrint("getAuthUserUid - ex - ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }
}
