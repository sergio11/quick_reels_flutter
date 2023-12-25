import 'package:flutter/material.dart';
import 'package:quickreels/app/core/widget/reel_detail_item.dart';
import 'package:quickreels/app/domain/model/reel.dart';

class ReelsPreview extends StatefulWidget {
  final ReelBO reel;
  final String authUserUuid;
  final VoidCallback onGoToComments;
  final VoidCallback onReelLiked;
  final VoidCallback onReelShared;
  final VoidCallback onGoToAuthorProfile;

  const ReelsPreview(
      {Key? key,
      required this.reel,
      required this.authUserUuid,
      required this.onGoToComments,
      required this.onReelLiked,
      required this.onReelShared,
      required this.onGoToAuthorProfile})
      : super(key: key);

  @override
  State<ReelsPreview> createState() => _ReelsPreviewState();
}

class _ReelsPreviewState extends State<ReelsPreview> {
  @override
  Widget build(BuildContext context) {
    return ReelDetailItem(
      reel: widget.reel,
      authUserUuid: widget.authUserUuid,
      onGoToComments: widget.onGoToComments,
      onReelLiked: widget.onReelLiked,
      onGoToAuthorProfile: widget.onGoToAuthorProfile,
      onReelShared: widget.onReelShared,
    );
  }
}
