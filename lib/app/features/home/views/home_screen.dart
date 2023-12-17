import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/reel_detail_item.dart';
import 'package:quickreels/app/features/home/controller/home_controller.dart';
import 'package:quickreels/app/features/home/model/home_ui_data.dart';

class HomeScreen extends BaseView<HomeController, HomeUiData> {
  final VoidCallback onGoToComments;

  HomeScreen({required this.onGoToComments});

  @override
  Widget body(BuildContext context, uiData) {
    return SafeArea(child: _buildScreenContent(context, uiData));
  }

  Widget _buildScreenContent(BuildContext context, HomeUiData uiData) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: uiData.reels.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => ReelDetailItem(
            contentPadding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            reel: uiData.reels[index],
            authUserUuid: uiData.authUserUuid,
            onGoToComments: () {},
            onReelLiked: () {},
          )),
        _buildMainLogo(),
      ],
    );
  }

  Widget _buildMainLogo() {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.topCenter,
        child: SvgPicture.asset(
          'assets/images/main_logo.svg',
          color: AppColors.colorWhite,
          height: 50,
        ));
  }
}
