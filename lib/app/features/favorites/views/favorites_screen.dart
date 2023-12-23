import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/reel_thumbnail_widget.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/features/favorites/controller/favorites_controller.dart';
import 'package:quickreels/app/features/favorites/model/favorites_ui_data.dart';

class FavoritesScreen extends BaseView<FavoritesController, FavoritesUiState> {
  final Function(String reelUuid) onGoToComments;

  FavoritesScreen({required this.onGoToComments});

  @override
  PreferredSizeWidget? appBar(BuildContext context, FavoritesUiState uiData) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColors.colorWhite, //change your color here
      ),
      backgroundColor: AppColors.backgroundColor,
      title: Text("Favorites",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.colorWhite)),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context, FavoritesUiState uiData) {
    return _buildReelsGridView(context, uiData);
  }

  Widget _buildReelsGridView(BuildContext context, FavoritesUiState uiData) {
    return GridView.builder(
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
        onReelLiked: () {},
        onGoToAuthorProfile: () {});
  }
}
