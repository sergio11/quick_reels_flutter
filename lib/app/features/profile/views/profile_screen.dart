import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/values/text_styles.dart';
import 'package:quickreels/app/core/widget/video_thumbnail_widget.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/features/profile/controller/profile_controller.dart';
import 'package:quickreels/app/features/profile/model/profile_ui_data.dart';

class ProfileScreen extends BaseView<ProfileController, ProfileUiData> {

  @override
  PreferredSizeWidget? appBar(BuildContext context, ProfileUiData uiData) {
    return AppBar(
      backgroundColor: Colors.black12,
      leading: const Icon(
        Icons.person_add_alt_1_outlined,
      ),
      actions: const [
        Icon(Icons.more_horiz),
      ],
      title: Text(
        uiData.userData?.username ?? "",
        style: whiteText18,
      ),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context, ProfileUiData uiData) {
    return SafeArea(
      child: _buildScreenContent(context, uiData),
    );
  }

  Widget _buildScreenContent(BuildContext context, ProfileUiData uiData) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildProfileImage(context, uiData),
              _buildProfileRowMetrics(context, uiData),
              _buildMainActionButton(context, uiData),
            ],
          ),
        ),
        _buildReelsGridView(context, uiData)
      ],
    ));
  }

  Widget _buildProfileImage(BuildContext context, ProfileUiData uiData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorWhite),
            borderRadius: BorderRadius.circular(40)
          ),
          child: buildCircleImage(imageUrl: uiData.userData?.photoUrl ?? "", showBackgroundColor: false, radius: 40),
        )
      ],
    );
  }

  Widget _buildProfileRowMetrics(BuildContext context, ProfileUiData uiData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              uiData.userData?.followingCount.toString() ?? "",
              style: whiteText18,
            ),
            const SizedBox(height: 3),
            const Text(
              'Following',
              style: whiteText16,
            ),
          ],
        ),
        Container(
          color: AppColors.colorWhite,
          width: 1,
          height: 15,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
        ),
        Column(
          children: [
            Text(
              uiData.userData?.followersCount.toString() ?? "",
              style: whiteText18,
            ),
            const SizedBox(height: 3),
            const Text(
              'Followers',
              style: whiteText16,
            ),
          ],
        ),
        Container(
          color: AppColors.colorWhite,
          width: 1,
          height: 15,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
        ),
        Column(
          children: [
            Text(
              uiData.userData?.likesCount.toString() ?? "",
              style: whiteText18,
            ),
            const SizedBox(height: 3),
            const Text(
              'Likes',
              style: whiteText16,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainActionButton(BuildContext context, ProfileUiData uiData) {
    return Container(
        width: 140,
        height: 47,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.colorWhite,
          ),
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              if (uiData.isAuthUser) {
                showConfirmDialog(
                  context: context,
                  title: 'Sign Out',
                  description: 'Are you sure you want to log out?',
                  onAcceptPressed: () {
                    controller.signOut();
                  },
                );
              } else {
                controller.followUser();
              }
            },
            child: Text(
              uiData.isAuthUser
                  ? 'Sign Out'
                  : uiData.isFollowing
                      ? 'Unfollow'
                      : 'Follow',
              style: whiteText16,
            ),
          ),
        ));
  }

  Widget _buildReelsGridView(BuildContext context, ProfileUiData uiData) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: uiData.reels.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          childAspectRatio: 0.7,
          crossAxisSpacing: 6,
        ),
        itemBuilder: (context, index) => _buildReelItem(uiData.reels[index], uiData.userUuid),
      ),
    );
  }

  Widget _buildReelItem(ReelBO reel, String userUuid) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.colorWhite)
        ),
        padding: const EdgeInsets.all(1),
        child: SizedBox(
          child: VideoThumbnailWidget(
            videoUrl: reel.url,
          ),
        ),
      ),
      onLongPress: () => showReelPreviewDialog(context, reel, userUuid),
      onDoubleTap: () => showReelPreviewDialog(context, reel, userUuid),
      onTap: () {},
    );
  }
}
