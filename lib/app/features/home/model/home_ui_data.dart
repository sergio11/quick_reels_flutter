import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickreels/app/domain/model/reel.dart';

part 'home_ui_data.freezed.dart';

@freezed
class HomeUiData with _$HomeUiData {
  const factory HomeUiData({
    @Default("") final String authUserUuid,
    @Default([]) final List<ReelBO> reels,
  }) = _HomeUiData;
}