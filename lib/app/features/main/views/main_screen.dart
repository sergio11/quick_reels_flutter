import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/features/main/controller/main_controller.dart';
import 'package:quickreels/app/features/main/model/main_ui_data.dart';

class MainScreen extends BaseView<MainController, MainUiData> {
  final Color unselectedColor = AppColors.colorWhite;
  final Color selectedColor = AppColors.colorPrimary;

  final List<Widget> tabItems;

  MainScreen({required this.tabItems});

  void onAddPostClicked() {}

  @override
  Widget body(BuildContext context, MainUiData uiData) {
    return SafeArea(
      child: _buildBottomBar(context, uiData),
    );
  }

  Widget _buildBottomBar(BuildContext context, MainUiData uiData) {
    return BottomBar(
        clip: Clip.none,
        fit: StackFit.expand,
        icon: (width, height) => Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: unselectedColor,
                  size: width,
                ),
              ),
            ),
        borderRadius: BorderRadius.circular(500),
        barDecoration: !uiData.isKeyboardVisible
            ? BoxDecoration(
                border: Border.all(color: AppColors.colorWhite, width: 2),
                borderRadius: BorderRadius.circular(500),
              )
            : null,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.8,
        barColor: AppColors.backgroundColor,
        start: 2,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 30,
        iconWidth: 30,
        reverse: false,
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => _buildTabBarView(uiData),
        child: Visibility(
            visible: !uiData.isKeyboardVisible,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                _buildTabBar(uiData),
                _buildFloatingActionButton(uiData)
              ],
            )));
  }

  Widget _buildTabBarView(MainUiData uiData) {
    return TabBarView(
      controller: controller.tabController,
      dragStartBehavior: DragStartBehavior.down,
      physics: const BouncingScrollPhysics(),
      children: tabItems,
    );
  }

  Widget _buildTabBar(MainUiData uiData) {
    return TabBar(
      onTap: (index) {
        if (index == 2) {
          onAddPostClicked();
        } else {
          controller.changePage(index);
        }
      },
      indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
      controller: controller.tabController,
      indicator: _buildUnderlineTabIndicator(),
      tabs: uiData.tabMenuItems
          .asMap()
          .map((key, value) => MapEntry(key, _buildTab(key, value, uiData)))
          .values
          .toList(),
    );
  }

  Widget _buildFloatingActionButton(MainUiData uiData) {
    return Positioned(
      top: -15,
      child: FloatingActionButton(
        onPressed: onAddPostClicked,
        child: Transform.scale(
            scale: 1.7,
            child: const Icon(Icons.add_box)
        ),
      ),
    );
  }

  UnderlineTabIndicator _buildUnderlineTabIndicator() {
    return UnderlineTabIndicator(
        borderSide: BorderSide(
          color: selectedColor,
          width: 4,
        ),
        insets: const EdgeInsets.fromLTRB(16, 0, 16, 8));
  }

  Widget _buildTab(int idx, IconData icon, MainUiData uiData) {
    return SizedBox(
      height: 55,
      width: 40,
      child: Center(
        child: Icon(
          icon,
          color: uiData.currentPage == idx ? selectedColor : unselectedColor,
        ),
      ),
    );
  }
}
