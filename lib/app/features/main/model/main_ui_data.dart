import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_ui_data.freezed.dart';

@freezed
class MainUiData with _$MainUiData {
  const factory MainUiData({
    @Default([]) final List<IconData> tabMenuItems,
    @Default(0) final int currentPage,
  }) = _MainUiData;
}