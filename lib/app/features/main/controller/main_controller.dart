import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/features/home/views/home_screen.dart';
import 'package:quickreels/app/features/main/model/main_ui_data.dart';
import 'package:quickreels/app/features/profile/views/profile_screen.dart';

class MainController extends BaseController<MainUiData>
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  static const pageTitleList = [
    "QuickReals",
    "Discover",
    "Add",
    "My Favorites",
    "My Profile"
  ];

  MainController()
      : super(
            initialUiState: MainUiData(tabMenuItems: const [
          Icons.home,
          Icons.search,
          Icons.add,
          Icons.favorite,
          Icons.person_outline
        ], tabItems: [
          HomeScreen(
            onGoToComments: () {},
          ),
          const Text("Search"),
          const Text("Add"),
          const Text("Favorite"),
          ProfileScreen()
        ]));

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: uiData.tabItems.length);
    changePage(0);
  }

  @override
  void onClose() {
    tabController.dispose();
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

  void changePage(int newPage) {
    updateState(uiData.copyWith(
        currentPage: newPage, pageTitle: pageTitleList[newPage], hasAppBar: newPage > 0));
  }
}
