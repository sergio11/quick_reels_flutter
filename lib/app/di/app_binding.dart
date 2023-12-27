import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/auth_datasource.dart';
import 'package:quickreels/app/data/datasource/dto/comment_dto.dart';
import 'package:quickreels/app/data/datasource/dto/reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/save_reel_comment_dto.dart';
import 'package:quickreels/app/data/datasource/dto/create_reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/save_user_dto.dart';
import 'package:quickreels/app/data/datasource/dto/song_dto.dart';
import 'package:quickreels/app/data/datasource/dto/update_reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/data/datasource/impl/auth_datasource_impl.dart';
import 'package:quickreels/app/data/datasource/impl/reels_datasource_impl.dart';
import 'package:quickreels/app/data/datasource/impl/song_datasource_impl.dart';
import 'package:quickreels/app/data/datasource/impl/storage_datasource_impl.dart';
import 'package:quickreels/app/data/datasource/impl/user_datasource_impl.dart';
import 'package:quickreels/app/data/datasource/mapper/comment_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/mapper/reel_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/mapper/save_reel_comment_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/mapper/save_reel_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/mapper/save_user_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/mapper/song_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/mapper/update_reel_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/mapper/user_dto_mapper.dart';
import 'package:quickreels/app/data/datasource/reel_datasource.dart';
import 'package:quickreels/app/data/datasource/song_datasource.dart';
import 'package:quickreels/app/data/datasource/storage_datasource.dart';
import 'package:quickreels/app/data/datasource/user_datasource.dart';
import 'package:quickreels/app/data/mapper/comment_bo_mapper.dart';
import 'package:quickreels/app/data/mapper/reel_bo_mapper.dart';
import 'package:quickreels/app/data/mapper/user_bo_mapper.dart';
import 'package:quickreels/app/data/repository/auth_repository_impl.dart';
import 'package:quickreels/app/data/repository/reel_repository_impl.dart';
import 'package:quickreels/app/data/repository/user_repository_impl.dart';
import 'package:quickreels/app/domain/model/comment.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';
import 'package:quickreels/app/domain/repository/user_repository.dart';
import 'package:quickreels/app/domain/usecase/fetch_geolocation_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/fetch_user_home_feed_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_all_comments_by_reel_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_all_followed_by_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_favorites_reels_by_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_followers_by_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_reel_by_id_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_reels_by_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_reels_order_by_date_published_use_case.dart';
import 'package:quickreels/app/domain/usecase/find_users_by_name_use_case.dart';
import 'package:quickreels/app/domain/usecase/follow_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_user_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/like_reel_use_case.dart';
import 'package:quickreels/app/domain/usecase/publish_comment_use_case.dart';
import 'package:quickreels/app/domain/usecase/publish_reel_use_case.dart';
import 'package:quickreels/app/domain/usecase/share_reel_use_case.dart';
import 'package:quickreels/app/domain/usecase/sign_in_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/sign_out_use_case.dart';
import 'package:quickreels/app/domain/usecase/sign_up_user_use_case.dart';
import 'package:quickreels/app/domain/usecase/update_user_use_case.dart';
import 'package:quickreels/app/features/shared/app_controller.dart';
import 'package:quickreels/app/core/utils/app_event_bus.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    _initCoreDependencies();
    _initFirebaseDependencies();
    _initMapperDependencies();
    _initDatasourceDependencies();
    _initRepositoryDependencies();
    _initUseCasesDependencies();
    _initSharedDependencies();
  }

  void _initCoreDependencies() {
    Get.put<AppEventBus>(AppEventBus());
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
    Get.put<Mapper<DocumentSnapshot, CommentDTO>>(CommentDtoMapper());
    Get.put<Mapper<DocumentSnapshot, ReelDTO>>(ReelDtoMapper());
    Get.put<Mapper<DocumentSnapshot, ReelDTO>>(ReelDtoMapper());
    Get.put<Mapper<SaveReelCommentDTO, Map<String, dynamic>>>(
        SaveReelCommentDTOMapper());
    Get.put<Mapper<CreateReelDTO, Map<String, dynamic>>>(SaveReelDtoMapper());
    Get.put<Mapper<UpdateReelDTO, Map<String, dynamic>>>(UpdatePostDtoMapper());
    Get.put<Mapper<ReelBoMapperData, ReelBO>>(ReelBoMapper());
    Get.put<Mapper<CommentBoMapperData, CommentBO>>(
        CommentBoMapper(userMapper: Get.find()));
    Get.put<Mapper<DocumentSnapshot, SongDTO>>(SongDtoMapper());
  }

  void _initDatasourceDependencies() {
    Get.put<UserDatasource>(UserDatasourceImpl(
        firestore: Get.find(),
        userDtoMapper: Get.find(),
        saveUserDtoMapper: Get.find()));
    Get.put<AuthDatasource>(AuthDatasourceImpl(auth: Get.find()));
    Get.put<StorageDatasource>(StorageDatasourceImpl(storage: Get.find()));
    Get.put<ReelsDatasource>(ReelsDatasourceImpl(
        firestore: Get.find(),
        saveReelCommentMapper: Get.find(),
        saveReelMapper: Get.find(),
        updateReelMapper: Get.find(),
        commentMapper: Get.find(),
        reelMapper: Get.find()));
    Get.put<SongDatasource>(
        SongDataSourceImpl(firestore: Get.find(), songMapper: Get.find()));
  }

  void _initRepositoryDependencies() {
    Get.put<UserRepository>(UserRepositoryImpl(
        userDatasource: Get.find(),
        userBoMapper: Get.find(),
        storageDatasource: Get.find()));
    Get.put<AuthRepository>(AuthRepositoryImpl(
        authDatasource: Get.find(),
        userDatasource: Get.find(),
        storageDatasource: Get.find(),
        userBoMapper: Get.find()));
    Get.put<ReelRepository>(ReelRepositoryImpl(
        reelsDatasource: Get.find(),
        userDatasource: Get.find(),
        storageDatasource: Get.find(),
        userBoMapper: Get.find(),
        reelBoMapper: Get.find(),
        commentBoMapper: Get.find(),
        songDatasource: Get.find()));
  }

  void _initUseCasesDependencies() {
    Get.put<GetAuthUserUidUseCase>(
        GetAuthUserUidUseCase(authRepository: Get.find()));
    Get.put<SignInUserUseCase>(
        SignInUserUseCase(authRepository: Get.find(), appEventBus: Get.find()));
    Get.put<SignOutUseCase>(
        SignOutUseCase(authRepository: Get.find(), appEventBus: Get.find()));
    Get.put<SignUpUserUseCase>(
        SignUpUserUseCase(authRepository: Get.find(), appEventBus: Get.find()));
    Get.put<GetUserDetailsUseCase>(
        GetUserDetailsUseCase(authRepository: Get.find()));
    Get.put<FetchUserHomeFeedUseCase>(FetchUserHomeFeedUseCase(
        authRepository: Get.find(),
        reelRepository: Get.find(),
        userRepository: Get.find()));
    Get.put<FindFavoritesReelsByUserUseCase>(
        FindFavoritesReelsByUserUseCase(reelRepository: Get.find()));
    Get.put<ShareReelUseCase>(ShareReelUseCase(
        authRepository: Get.find(), reelRepository: Get.find()));
    Get.put<FindFollowersByUserUseCase>(
        FindFollowersByUserUseCase(userRepository: Get.find()));
    Get.put<FindReelByIdUseCase>(
        FindReelByIdUseCase(reelRepository: Get.find()));
    Get.put<FindReelsByUserUseCase>(
        FindReelsByUserUseCase(reelRepository: Get.find()));
    Get.put<FindReelsOrderByDatePublishedUseCase>(
        FindReelsOrderByDatePublishedUseCase(reelRepository: Get.find()));
    Get.put<FollowUserUseCase>(FollowUserUseCase(
        authRepository: Get.find(), userRepository: Get.find()));
    Get.put<FindUsersByNameUseCase>(
        FindUsersByNameUseCase(userRepository: Get.find()));
    Get.put<LikeReelUseCase>(LikeReelUseCase(
        authRepository: Get.find(), reelRepository: Get.find()));
    Get.put<PublishCommentUseCase>(PublishCommentUseCase(
        authRepository: Get.find(), reelRepository: Get.find()));
    Get.put<FindAllCommentsByReelUseCase>(
        FindAllCommentsByReelUseCase(reelRepository: Get.find()));
    Get.put<FindAllFollowedByUseCase>(
        FindAllFollowedByUseCase(userRepository: Get.find()));
    Get.put<UpdateUserUseCase>(UpdateUserUseCase(userRepository: Get.find()));
    Get.put<PublishReelUseCase>(PublishReelUseCase(
        authRepository: Get.find(), reelRepository: Get.find()));
    Get.put<FetchGeolocationDetailsUseCase>(FetchGeolocationDetailsUseCase());
  }

  void _initSharedDependencies() {
    Get.put<AppController>(
        AppController(eventBus: Get.find(), getAuthUserUidUseCase: Get.find()));
  }
}
