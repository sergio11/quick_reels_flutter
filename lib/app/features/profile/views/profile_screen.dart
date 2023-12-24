import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/values/text_styles.dart';
import 'package:quickreels/app/core/widget/reel_thumbnail_widget.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/features/profile/controller/profile_controller.dart';
import 'package:quickreels/app/features/profile/model/profile_ui_data.dart';

class ProfileScreen extends BaseView<ProfileController, ProfileUiData> {
  final Function(String userUid) onShowUserProfile;
  final Function(String userUid) onShowFollowers;
  final Function(String userUid) onShowFollowing;
  final Function(String userUid) onShowFavorites;
  final Function(String reelUuid) onGoToComments;
  final Function(String userUid) onEditProfile;

  ProfileScreen(
      {required this.onShowUserProfile,
      required this.onShowFollowers,
      required this.onShowFollowing,
      required this.onShowFavorites,
      required this.onGoToComments,
      required this.onEditProfile});

  @override
  PreferredSizeWidget? appBar(BuildContext context, ProfileUiData uiData) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      leading: uiData.isAuthUser
          ? IconButton(
              icon: const Icon(
                Icons.edit,
                color: AppColors.colorWhite,
              ),
              onPressed: () => onEditProfile(uiData.userUuid),
            )
          : null,
      actions: const [
        Icon(Icons.more_horiz, color: AppColors.colorWhite),
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
              _buildProfileDescription(context, uiData),
              _buildProfileRow(context, uiData),
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
              borderRadius: BorderRadius.circular(40)),
          child: buildCircleImage(
              imageUrl: uiData.userData?.photoUrl ?? "",
              showBackgroundColor: false,
              radius: 40),
        )
      ],
    );
  }

  Widget _buildProfileDescription(BuildContext context, ProfileUiData uiData) {
    final profileDescription = uiData.userData?.bio ?? "";
    return profileDescription.isNotEmpty
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              profileDescription,
              style: whiteText16,
              textAlign: TextAlign.center,
            ))
        : Container();
  }

  Widget _buildProfileRow(BuildContext context, ProfileUiData uiData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileRowMetrics(
            context,
            appLocalization.profileScreenFollowingLabel,
            uiData.userData?.followingCount,
            () => onShowFollowing(uiData.userUuid)),
        _buildVerticalDivider(),
        _buildProfileRowMetrics(
            context,
            appLocalization.profileScreenFollowersLabel,
            uiData.userData?.followersCount,
            () => onShowFollowers(uiData.userUuid)),
        _buildVerticalDivider(),
        _buildProfileRowMetrics(
            context,
            appLocalization.profileScreenLikesLabel,
            uiData.userData?.likesCount,
            () => onShowFavorites(uiData.userUuid)),
      ],
    );
  }

  Widget _buildProfileRowMetrics(
      BuildContext context, String label, int? count, Function onTap) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        children: [
          Text(
            count?.toString() ?? "",
            style: whiteText18,
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: whiteText16,
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      color: AppColors.colorWhite,
      width: 1,
      height: 15,
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
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
                  title: appLocalization.profileScreenSignOutDialogTitle,
                  description:
                      appLocalization.profileScreenSignOutDialogDescription,
                  onAcceptPressed: () => controller.signOut(),
                );
              } else {
                controller.followUser();
              }
            },
            child: Text(
              uiData.isAuthUser
                  ? appLocalization.profileScreenSignOutButton
                  : uiData.isFollowing
                      ? appLocalization.profileScreenUnFollowButton
                      : appLocalization.profileScreenFollowButton,
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
        itemBuilder: (context, index) =>
            _buildReelItem(uiData.reels[index], uiData.userUuid),
      ),
    );
  }

  Widget _buildReelItem(ReelBO reel, String userUuid) {
    return GestureDetector(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.colorWhite)),
        padding: const EdgeInsets.all(1),
        child: ReelThumbnailWidget(
          reelBO: reel,
        ),
      ),
      onLongPress: () => _showReelPreview(reel, userUuid),
      onDoubleTap: () => _showReelPreview(reel, userUuid),
      onTap: () => _showReelPreview(reel, userUuid),
    );
  }

  void _showReelPreview(ReelBO reel, String userUuid) {
    showReelPreviewDialog(
        context: context,
        reel: reel,
        authUserUuid: userUuid,
        onGoToComments: () => onGoToComments(reel.reelId),
        onReelLiked: () => controller.likeReel(reel.reelId),
        onGoToAuthorProfile: () => onShowUserProfile(reel.authorUid));
  }
}
