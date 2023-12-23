import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/empty_state_widget.dart';
import 'package:quickreels/app/core/widget/user_list_tile.dart';
import 'package:quickreels/app/features/followers/controller/followers_controller.dart';
import 'package:quickreels/app/features/followers/model/content_type_enum.dart';
import 'package:quickreels/app/features/followers/model/followers_ui_data.dart';

class FollowersScreen extends BaseView<FollowersController, FollowersUiState> {
  final Function(String userUid) onShowUserProfile;

  FollowersScreen({required this.onShowUserProfile});

  @override
  PreferredSizeWidget? appBar(BuildContext context, FollowersUiState uiData) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColors.colorWhite, //change your color here
      ),
      backgroundColor: AppColors.backgroundColor,
      title: Text(
          uiData.contentType == ContentTypeEnum.followers
              ? "Followers"
              : "Following",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.colorWhite)),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context, FollowersUiState uiData) {
    return SafeArea(child: _buildUsersListView(uiData));
  }

  Widget _buildUsersListView(FollowersUiState state) {
    return RefreshIndicator(
        color: AppColors.colorPrimary,
        backgroundColor: AppColors.backgroundColor,
        onRefresh: () => Future.delayed(
              const Duration(seconds: 1),
              () => controller.refreshContent(),
            ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: state.users.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.only(top: 8),
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.users.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: AppColors.colorDark,
                        border: Border.all(
                          color: AppColors.colorWhite,
                          width: 1.0,
                        ),
                      ),
                      child: InkWell(
                        onTap: () =>
                            onShowUserProfile(state.users[index].uid),
                        child: UserListTile(
                          userBO: state.users[index],
                          onFollowPressed: () =>
                              controller.toggleFollowUser(state.users[index].uid),
                          onUnFollowPressed: () =>
                              controller.toggleFollowUser(state.users[index].uid),
                          isFollowedByAuthUser: state.users[index].followers
                              .contains(state.authUserUid),
                          isAuthUser:
                          state.users[index].uid == state.authUserUid,
                        ),
                      )),
                )
              : EmptyStateWidget(
                  message: "No users found",
                  iconData: Icons.mood_bad,
                  onRetry: () => controller.refreshContent(),
                ),
        ));
  }
}
