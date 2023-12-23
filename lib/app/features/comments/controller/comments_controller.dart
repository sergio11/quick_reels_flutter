import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/comment.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/usecase/find_all_comments_by_reel_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_user_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/publish_comment_use_case.dart';
import 'package:quickreels/app/features/comments/model/comments_ui_data.dart';

class CommentsController extends BaseController<CommentsUiState> {
  final PublishCommentUseCase publishCommentUseCase;
  final FindAllCommentsByReelUseCase findAllCommentsByReelUseCase;
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final GetUserDetailsUseCase getUserDetailsUseCase;

  late TextEditingController commentEditingController;

  static const String REEL_UUID_KEY = 'REEL_UUID_KEY';

  CommentsController(
      {required this.publishCommentUseCase,
      required this.findAllCommentsByReelUseCase,
      required this.getAuthUserUidUseCase,
      required this.getUserDetailsUseCase})
      : super(initialUiState: const CommentsUiState());

  @override
  void onInit() {
    super.onInit();
    commentEditingController = TextEditingController();
    Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      if (args.containsKey(REEL_UUID_KEY)) {
        String? reelUuid = args[REEL_UUID_KEY] as String?;
        if (reelUuid != null) {
          _onLoadCommentsByReel(reelUuid);
          return;
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    commentEditingController.dispose();
  }

  void publishComment() {
    if (commentEditingController.text.isNotEmpty) {
      callUseCase(
          publishCommentUseCase(PublishCommentParams(
              uiData.reelUuid, commentEditingController.text)),
          onSuccess: _handleOnCommentPublished, onComplete: (_) {
        commentEditingController.clear();
      });
    }
  }

  void refreshContent() {
    _onLoadCommentsByReel(uiData.reelUuid);
  }

  void _onLoadCommentsByReel(String reelUuid) async {
    try {
      final String authUserUid =
          await getAuthUserUidUseCase(const DefaultParams());
      final userDetails =
          getUserDetailsUseCase(GetUserDetailsParams(authUserUid));
      final commentsByReel =
          findAllCommentsByReelUseCase(FindAllCommentsByReelParams(reelUuid));
      callUseCase(Future.wait([userDetails, commentsByReel]),
          onSuccess: (result) {
        _handleOnLoadCommentsCompleted(result, authUserUid, reelUuid);
      });
    } catch (e) {
      showErrorMessage("An error occurred while loading comments by reel");
    }
  }

  void _handleOnLoadCommentsCompleted(
      List result, String userUuid, String reelUuid) {
    final UserBO? userDetails = result.elementAtOrNull(0) is UserBO
        ? result.elementAtOrNull(0) as UserBO
        : null;
    final List<CommentBO> commentsByReel =
        result.elementAtOrNull(1) is List<CommentBO>
            ? result.elementAtOrNull(1) as List<CommentBO>
            : List.empty();

    updateState(uiData.copyWith(
        authUserUuid: userUuid,
        reelUuid: reelUuid,
        authUserImageUrl: userDetails?.photoUrl ?? "",
        commentsByReel: commentsByReel));
  }

  void _handleOnCommentPublished(CommentBO comment) {
    updateState(uiData.copyWith(
        commentsByReel: List.from(uiData.commentsByReel)..add(comment)));
  }
}
