import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/utils/app_event_bus.dart';
import 'package:quickreels/app/features/main/model/main_ui_data.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'dart:async';

import 'package:quickreels/app/features/shared/events/events.dart';

class MainController extends BaseController<MainUiData>
    with GetSingleTickerProviderStateMixin {
  final AppEventBus eventBus;
  late TabController tabController;
  late StreamSubscription<bool> keyboardSubscription;

  MainController({required this.eventBus})
      : super(
            initialUiState: const MainUiData(tabMenuItems: [
          Icons.home,
          Icons.search,
          Icons.add_box,
          Icons.favorite,
          Icons.person_outline
        ]));

  @override
  void onInit() {
    super.onInit();
    ever(eventBus.events, (event) {
      if(event is UploadReelProcessCanceledEvent || event is ReelUploadedEvent) {
        goToPreviousTab();
      }
    });
    tabController =
        TabController(vsync: this, length: uiData.tabMenuItems.length);
    changePage(0);
    _configureKeyboardVisibilityController();
  }

  @override
  void onClose() {
    tabController.dispose();
    keyboardSubscription.cancel();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    tabController.animation?.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != uiData.currentPage) {
          changePage(value);
        }
      },
    );
  }

  void goToPreviousTab() {
    final int currentPage = tabController.index;
    if (currentPage > 0) {
      tabController.animateTo(currentPage - 1);
    }
  }

  void _configureKeyboardVisibilityController() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      updateState(uiData.copyWith(isKeyboardVisible: visible));
    });
  }

  void changePage(int newPage) {
    updateState(uiData.copyWith(currentPage: newPage));
  }
}
