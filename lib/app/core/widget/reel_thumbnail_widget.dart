import 'package:flutter/material.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/video_thumbnail_widget.dart';
import 'package:quickreels/app/domain/model/reel.dart';

class ReelThumbnailWidget extends StatelessWidget {
  final ReelBO reelBO;

  const ReelThumbnailWidget({Key? key, required this.reelBO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: VideoThumbnailWidget(
              videoUrl: reelBO.url,
            )),
        _buildReelInfo(context)
      ],
    );
  }

  Widget _buildReelInfo(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildItemDetail(context, Icons.favorite, reelBO.likes.length),
              const SizedBox(width: 5,),
              _buildItemDetail(context, Icons.comment, reelBO.commentCount),
              const SizedBox(width: 5,),
              _buildItemDetail(context, Icons.share, reelBO.shareCount),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDetail(BuildContext context, IconData icon, int count) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: Colors.white,
        ),
        const SizedBox(width: 5,),
        Text(
          count.toString(),
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: AppColors.colorWhite),
        )
      ],
    );
  }
}
