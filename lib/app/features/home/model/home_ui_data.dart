import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_ui_data.freezed.dart';

@freezed
class HomeUiData with _$HomeUiData {
  const factory HomeUiData({
    @Default(0) final int currentPage,
  }) = _HomeUiData;
}