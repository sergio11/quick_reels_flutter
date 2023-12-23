import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/repository/user_repository.dart';

class UpdateUserUseCase extends BaseUseCase<UserBO, UpdateUserParams> {
  final UserRepository userRepository;

  UpdateUserUseCase({required this.userRepository});

  @override
  Future<UserBO> call(UpdateUserParams param) async {
    return await userRepository.update(
      uid: param.uid,
      username: param.username,
      email: param.email,
      bio: param.bio,
      file: param.file,
    );
  }
}

class UpdateUserParams extends Equatable {
  String uid;
  String username;
  String email;
  String bio;
  Uint8List? file;

  UpdateUserParams({
    required this.uid,
    required this.username,
    required this.email,
    required this.bio,
    this.file,
  });

  @override
  List<Object> get props => [uid, username, username, email];
}
