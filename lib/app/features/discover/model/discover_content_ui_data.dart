import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/model/user.dart';

part 'discover_content_ui_data.freezed.dart';

@freezed
class DiscoverContentUiState with _$DiscoverContentUiState {
  const factory DiscoverContentUiState({
    @Default(false) final bool isShowUsers,
    @Default(true) final bool allowUserInput,
    @Default("") final String authUserUuid,
    @Default([]) final List<UserBO> users,
    @Default([]) final List<ReelBO> reels
  }) = _DiscoverContentUiState;
}