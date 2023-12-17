import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/widget/video_thumbnail_widget.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/features/profile/controller/profile_controller.dart';
import 'package:quickreels/app/features/profile/model/profile_ui_data.dart';

class ProfileScreen extends BaseView<ProfileController, ProfileUiData> {
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
        buildCircleImage(imageUrl: uiData.userData?.photoUrl ?? "")
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
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Following',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          color: Colors.black54,
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
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Followers',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          color: Colors.black54,
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
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Likes',
              style: TextStyle(
                fontSize: 14,
              ),
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
            color: Colors.black12,
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
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }

  Widget _buildReelsGridView(BuildContext context, ProfileUiData uiData) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: uiData.reels.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) => _buildReelItem(uiData.reels[index], uiData.userUuid),
      ),
    );
  }

  Widget _buildReelItem(ReelBO reel, String userUuid) {
    return GestureDetector(
      child: Container(
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
