import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/user_list_tile.dart';
import 'package:quickreels/app/core/widget/video_thumbnail_widget.dart';
import 'package:quickreels/app/features/discover/controller/discover_content_controller.dart';
import 'package:quickreels/app/features/discover/model/discover_content_ui_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DiscoverContentScreen
    extends BaseView<DiscoverContentController, DiscoverContentUiState> {
  final Function(String userUid) onShowUserProfile;

  final Random random = Random();
  final List<double> reelItemHeights = [250, 220, 300, 200, 270];

  DiscoverContentScreen({required this.onShowUserProfile});

  @override
  Widget body(BuildContext context, DiscoverContentUiState uiData) {
    return SafeArea(
      child: _buildScreenContent(context, uiData),
    );
  }

  Widget _buildScreenContent(
      BuildContext context, DiscoverContentUiState uiData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Form(child: _buildTextSearchView())),
        Expanded(
          child: uiData.isShowUsers
              ? _buildUsersGridView(uiData)
              : _buildReelsGridView(uiData),
        )
      ],
    );
  }

  Widget _buildTextSearchView() {
    return TextFormField(
      controller: controller.searchController,
      style: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(color: AppColors.colorWhite),
      decoration: InputDecoration(
          labelText: "Search ....",
          labelStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: AppColors.colorWhite),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.colorWhite,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.colorWhite,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.colorWhite,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIconColor: AppColors.colorWhite,
          filled: true,
          fillColor: AppColors.backgroundColor,
          suffixIcon: IconButton(
            onPressed: () {
              controller.searchUsers("");
            },
            icon: const Icon(Icons.clear, color: AppColors.colorWhite),
          )),
      onFieldSubmitted: (String term) {
        controller.searchUsers(term);
      },
    );
  }

  Widget _buildUsersGridView(DiscoverContentUiState state) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.users.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            color: AppColors.colorAccent,
            child: InkWell(
              onTap: () => onShowUserProfile(state.users[index].uid),
              child: UserListTile(
                  userBO: state.users[index],
                  onFollowPressed: () => _onFollowUser(state.users[index].uid),
                  onUnFollowPressed: () =>
                      _onUnFollowUser(state.users[index].uid),
                  isFollowedByAuthUser:
                      state.users[index].followers.contains(state.authUserUuid),
                  isAuthUser: state.users[index].uid == state.authUserUuid,
                  isDisabled: !state.allowUserInput),
            ));
      },
    );
  }

  Widget _buildReelsGridView(DiscoverContentUiState state) {
    return Container(
      color: AppColors.backgroundColor,
      child: MasonryGridView.count(
        crossAxisCount: 3,
        itemCount: state.reels.length,
        itemBuilder: (context, index) => GestureDetector(
          child: Container(
            decoration:
                BoxDecoration(border: Border.all(color: AppColors.colorWhite)),
            padding: const EdgeInsets.all(1),
            child: SizedBox(
              height: reelItemHeights[random.nextInt(reelItemHeights.length)],
              child: VideoThumbnailWidget(
                videoUrl: state.reels[index].url,
              ),
            ),
          ),
          onTap: () {
            showReelPreviewDialog(
                context, state.reels[index], state.authUserUuid);
          },
        ),
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
    );
  }

  void _onFollowUser(String userUid) {
    controller.toggleFollowUser(userUid);
  }

  void _onUnFollowUser(String userUid) {
    controller.toggleFollowUser(userUid);
  }
}