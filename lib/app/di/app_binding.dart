

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/auth_datasource.dart';
import 'package:quickreels/app/data/datasource/dto/save_user_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/data/datasource/impl/auth_datasource_impl.dart';
import 'package:quickreels/app/data/datasource/impl/storage_datasource_impl.dart';
import 'package:quickreels/app/data/datasource/impl/user_datasource_impl.dart';
import 'package:quickreels/app/data/datasource/mapper/save_user_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/mapper/user_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/storage_datasource.dart';
import 'package:quickreels/app/data/datasource/user_datasource.dart';
import 'package:quickreels/app/data/mapper/user_bo_mapper.dart';
import 'package:quickreels/app/data/repository/auth_repository_impl.dart';
import 'package:quickreels/app/data/repository/user_repository_impl.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/domain/repository/user_repository.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_user_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/sign_in_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/sign_out_use_case.dart';
import 'package:quickreels/app/domain/usecase/sign_up_user_use_case.dart';

class AppBinding extends Bindings {

  @override
  void dependencies() {
    _initFirebaseDependencies();
    _initMapperDependencies();
    _initDatasourceDependencies();
    _initRepositoryDependencies();
    _initUseCasesDependencies();
  }

  void _initFirebaseDependencies() {
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance);
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
    Get.put<FirebaseStorage>(FirebaseStorage.instance);
  }

  void _initMapperDependencies() {
    Get.put<Mapper<DocumentSnapshot, UserDTO>>(UserDtoMapper());
    Get.put<Mapper<SaveUserDTO, Map<String, dynamic>>>(SaveUserDtoMapper());
    Get.put<Mapper<UserDTO, UserBO>>(UserBoMapper());
  }

  void _initDatasourceDependencies() {
    Get.put<UserDatasource>(UserDatasourceImpl(firestore: Get.find(), userDtoMapper: Get.find(), saveUserDtoMapper: Get.find()));
    Get.put<AuthDatasource>(AuthDatasourceImpl(auth: Get.find()));
    Get.put<StorageDatasource>(StorageDatasourceImpl(storage: Get.find()));
  }

  void _initRepositoryDependencies() {
    Get.put<UserRepository>(UserRepositoryImpl(userDatasource: Get.find(), userBoMapper: Get.find()));
    Get.put<AuthRepository>(AuthRepositoryImpl(authDatasource: Get.find(), userDatasource: Get.find(), storageDatasource: Get.find(), userBoMapper: Get.find()));
  }

  void _initUseCasesDependencies() {
    Get.put<GetAuthUserUidUseCase>(
        GetAuthUserUidUseCase(authRepository: Get.find()));
    Get.put<SignInUserUseCase>(SignInUserUseCase(authRepository: Get.find()));
    Get.put<SignOutUseCase>(SignOutUseCase(authRepository: Get.find()));
    Get.put<SignUpUserUseCase>(SignUpUserUseCase(authRepository: Get.find()));
    Get.put<GetUserDetailsUseCase>(
        GetUserDetailsUseCase(authRepository: Get.find()));
  }
}