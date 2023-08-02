import 'dart:typed_data';

import 'package:quickreels/app/domain/model/user.dart';

abstract class AuthRepository {
  Future<String> getAuthUserUid();

  Future<UserBO> getUserDetails({
    required String userUid
  });

  Future<bool> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  });

  Future<bool> signInUser({
    required String email,
    required String password,
  });

  Future<bool> signOut();
}
