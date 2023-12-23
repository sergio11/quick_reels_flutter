import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/features/followers/model/content_type_enum.dart';

part 'followers_ui_data.freezed.dart';

@freezed
class FollowersUiState with _$FollowersUiState {
  const factory FollowersUiState({
    @Default([]) final List<UserBO> users,
    @Default("") final String authUserUid,
    @Default("") final String userUid,
    @Default(ContentTypeEnum.followers) ContentTypeEnum contentType,
  }) = _FollowersUiState;
}