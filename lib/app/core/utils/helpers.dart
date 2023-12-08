import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/animate_gradient_widget.dart';
import 'package:quickreels/app/core/widget/common_screen_progress_indicator.dart';

Widget buildCircleAvatar({
  required String imageUrl,
  double? radius,
  bool showBackgroundColor = true,
}) {
  return imageUrl.isEmpty
      ? CommonScreenProgressIndicator(
          backgroundColor:
              showBackgroundColor ? AppColors.colorPrimary : Colors.transparent,
          spinnerSize: radius ?? 40,
        )
      : _buildCachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundColor: AppColors.colorAccent,
                backgroundImage: imageProvider,
                radius: radius ?? 40,
              ),
          showBackgroundColor: showBackgroundColor);
}

Widget buildNetworkImage(String imageUrl) {
  return imageUrl.isEmpty
      ? const CommonScreenProgressIndicator()
      : _buildCachedNetworkImage(imageUrl: imageUrl);
}

CachedNetworkImage _buildCachedNetworkImage(
    {required String imageUrl,
    ImageWidgetBuilder? imageBuilder,
    bool showBackgroundColor = true}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.cover,
    imageBuilder: imageBuilder,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CommonScreenProgressIndicator(
      backgroundColor: showBackgroundColor ? AppColors.colorPrimary : Colors.transparent,
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

AnimateGradient wrapIntoAnimateGradient({required Widget child}) {
  return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: [
        AppColors.colorPrimary.withOpacity(0.8),
        AppColors.colorDark.withOpacity(0.8)
      ],
      secondaryColors: [
        AppColors.colorDark.withOpacity(0.8),
        AppColors.colorAccent.withOpacity(0.8)
      ],
      child: child);
}
