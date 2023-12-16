import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';
import 'package:quickreels/app/domain/repository/user_repository.dart';

class FetchUserHomeFeedUseCase
    extends BaseUseCase<List<ReelBO>, DefaultParams> {
  final AuthRepository authRepository;
  final ReelRepository reelRepository;
  final UserRepository userRepository;

  FetchUserHomeFeedUseCase(
      {required this.authRepository,
      required this.reelRepository,
      required this.userRepository});

  @override
  Future<List<ReelBO>> call(DefaultParams param) async {
    final authUserUid = await authRepository.getAuthUserUid();
    final usersResponse = await userRepository.findAllFollowedBy(authUserUid);
    return await findReelsByUsers(
        usersResponse.map((e) => e.uid).toList()..add(authUserUid));
  }

  Future<List<ReelBO>> findReelsByUsers(List<String> users) async {
    return users.isNotEmpty
        ? await reelRepository.findAllByUserUidListOrderByDatePublished(users)
        : await reelRepository.findAllOrderByDatePublished();
  }
}
