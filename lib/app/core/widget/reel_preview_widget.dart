import 'package:flutter/material.dart';
import 'package:quickreels/app/core/widget/reel_detail_item.dart';
import 'package:quickreels/app/domain/model/reel.dart';

class ReelsPreview extends StatefulWidget {
  final ReelBO reel;
  final String authUserUuid;

  const ReelsPreview({Key? key, required this.reel, required this.authUserUuid})
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
      onGoToComments: () {},
      onReelLiked: () {},
    );
  }
}
