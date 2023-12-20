import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickreels/app/domain/model/comment.dart';

part 'comments_ui_data.freezed.dart';

@freezed
class CommentsUiState with _$CommentsUiState {
  const factory CommentsUiState({
    @Default("") final String reelUuid,
    @Default("") final String authUserUuid,
    @Default("") final String authUserImageUrl,
    @Default([]) final List<CommentBO> commentsByReel
  }) = _CommentsUiState;
}