import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_ui_data.freezed.dart';

@freezed
class MainUiData with _$MainUiData {
  const factory MainUiData({
    @Default([]) final List<Widget> tabItems,
    @Default([]) final List<IconData> tabMenuItems,
    @Default(0) final int currentPage,
    @Default("") final String pageTitle,
  }) = _MainUiData;
}