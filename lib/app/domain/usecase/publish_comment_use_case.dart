import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/comment.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class PublishCommentUseCase
    extends BaseUseCase<CommentBO, PublishCommentParams> {
  final AuthRepository authRepository;
  final ReelRepository reelRepository;

  PublishCommentUseCase(
      {required this.authRepository, required this.reelRepository});

  @override
  Future<CommentBO> call(PublishCommentParams param) async {
    final authUserUuid = await authRepository.getAuthUserUid();
    return await reelRepository.postComment(
        reelId: param.reelId, text: param.text, authorUid: authUserUuid);
  }
}

class PublishCommentParams extends Equatable {
  final String reelId;
  final String text;

  const PublishCommentParams(this.reelId, this.text);

  @override
  List<Object> get props => [reelId, text];
}
