import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/comment_card.dart';
import 'package:quickreels/app/core/widget/empty_state_widget.dart';
import 'package:quickreels/app/features/comments/controller/comments_controller.dart';
import 'package:quickreels/app/features/comments/model/comments_ui_data.dart';

class CommentsScreen extends BaseView<CommentsController, CommentsUiState> {
  final VoidCallback onBackPressed;
  final Function(String userUid) onShowUserProfile;

  CommentsScreen(
      {required this.onBackPressed, required this.onShowUserProfile});

  @override
  PreferredSizeWidget? appBar(BuildContext context, CommentsUiState uiData) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.colorWhite,
          onPressed: onBackPressed),
      title: Text("Comments",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.colorWhite)),
      centerTitle: false,
    );
  }

  @override
  Widget body(BuildContext context, CommentsUiState uiData) {
    return _buildScreenContent(uiData);
  }

  Widget _buildScreenContent(CommentsUiState uiData) {
    return Column(
      children: [
        Expanded(child: _buildCommentsListView(uiData)),
        _buildTextInput(uiData)
      ],
    );
  }

  Widget _buildCommentsListView(CommentsUiState uiData) {
    return RefreshIndicator(
        color: AppColors.colorPrimary,
        backgroundColor: AppColors.backgroundColor,
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
            controller.refreshContent,
          );
        },
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: uiData.commentsByReel.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.only(top: 8),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: uiData.commentsByReel.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () => onShowUserProfile(
                          uiData.commentsByReel[index].author.uid),
                      child: CommentCard(
                        commentBO: uiData.commentsByReel[index],
                      ),
                    ),
                  )
                : EmptyStateWidget(
                    message: "Comments not found",
                    iconData: Icons.mood_bad,
                    onRetry: controller.refreshContent,
                  )));
  }

  Widget _buildTextInput(CommentsUiState uiData) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(
          color: AppColors.colorWhite,
          width: 2.0,
        ),
        boxShadow: const [
          BoxShadow(
              color: AppColors.colorDark,
              blurRadius: 20,
              blurStyle: BlurStyle.outer),
        ],
      ),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        children: [
          buildCircleImage(imageUrl: uiData.authUserImageUrl, radius: 22),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: TextField(
                  controller: controller.commentEditingController,
                  decoration: InputDecoration(
                    hintText: "Publish comment ...",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.colorWhite),
                    border: InputBorder.none,
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.colorWhite)),
            ),
          ),
          InkWell(
            onTap: () {
              hideKeyboard(context);
              controller.publishComment();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                "Publish",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.colorWhite, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
