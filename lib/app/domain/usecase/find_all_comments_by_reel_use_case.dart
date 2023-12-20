import 'package:equatable/equatable.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/comment.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class FindAllCommentsByReelUseCase
    extends BaseUseCase<List<CommentBO>, FindAllCommentsByReelParams> {
  final ReelRepository reelRepository;

  FindAllCommentsByReelUseCase({required this.reelRepository});

  @override
  Future<List<CommentBO>> call(FindAllCommentsByReelParams param) async {
    return await reelRepository.findAllCommentsByReelId(param.reelId);
  }
}

class FindAllCommentsByReelParams extends Equatable {
  final String reelId;

  const FindAllCommentsByReelParams(this.reelId);

  @override
  List<Object> get props => [reelId];
}
