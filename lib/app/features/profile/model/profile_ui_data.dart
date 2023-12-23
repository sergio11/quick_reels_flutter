import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/model/user.dart';

part 'profile_ui_data.freezed.dart';

@freezed
class ProfileUiData with _$ProfileUiData {
  const factory ProfileUiData({
    final UserBO? userData,
    @Default(false) final bool isFollowing,
    @Default("") final String userUuid,
    @Default("") final String authUserUuid,
    @Default(false) final bool isAuthUser,
    @Default([]) final List<ReelBO> reels
  }) = _ProfileUpUiData;
}