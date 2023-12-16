import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/features/profile/controller/profile_controller.dart';
import 'package:quickreels/app/features/profile/model/profile_ui_data.dart';

class ProfileScreen extends BaseView<ProfileController, ProfileUiData> {

  @override
  Widget body(BuildContext context, ProfileUiData uiData) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCircleImage(
                          imageUrl: uiData.userData?.photoUrl ?? "")
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildProfileRowMetrics(context, uiData),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildMainActionButton(context, uiData),
                  const SizedBox(
                    height: 25,
                  ),
                  // video list
                ],
              ),
            ),
          ],
        ),
      ),
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
}
