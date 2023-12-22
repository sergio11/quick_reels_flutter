import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/features/main/model/main_ui_data.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'dart:async';

class MainController extends BaseController<MainUiData>
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late StreamSubscription<bool> keyboardSubscription;

  MainController()
      : super(
            initialUiState: const MainUiData(tabMenuItems: [
          Icons.home,
          Icons.search,
          Icons.add,
          Icons.favorite,
          Icons.person_outline
        ]));

  @override
  void onInit() {
    super.onInit();
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
