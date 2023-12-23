import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickreels/app/domain/model/reel.dart';

part 'favorites_ui_data.freezed.dart';

@freezed
class FavoritesUiState with _$FavoritesUiState {
  const factory FavoritesUiState({
    @Default([]) final List<ReelBO> reels,
    @Default("") final String userUuid
  }) = _FavoritesUiState;
}