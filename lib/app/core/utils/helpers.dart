import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/animate_gradient_widget.dart';
import 'package:quickreels/app/core/widget/common_screen_progress_indicator.dart';

Widget buildUserAvatarImage(
    {required BuildContext context, required String imageUrl, double? radius}) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.colorWhite),
          borderRadius: BorderRadius.circular(radius ?? 22)),
      child: buildCircleImage(
          imageUrl: imageUrl, showBackgroundColor: false, radius: radius ?? 22),
    ),
    onTap: () => showImage(context, imageUrl),
  );
}

Widget buildCircleImage(
    {required String imageUrl,
    double? radius,
    bool showBackgroundColor = true,
    double? progressIndicatorSize = 80}) {
  return imageUrl.isEmpty
      ? SizedBox(
          height: progressIndicatorSize,
          width: progressIndicatorSize,
          child: CommonScreenProgressIndicator(
            backgroundColor:
                showBackgroundColor ? AppColors.colorWhite : Colors.transparent,
            spinnerSize: radius ?? 80,
          ),
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
      backgroundColor:
          showBackgroundColor ? AppColors.colorPrimary : Colors.transparent,
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
        AppColors.colorShadow.withOpacity(0.8)
      ],
      secondaryColors: [
        AppColors.colorPrimaryMedium.withOpacity(0.8),
        AppColors.colorShadow.withOpacity(0.9)
      ],
      child: child);
}

Widget buildAppLogo() {
  return SvgPicture.asset(
    "assets/images/app_logo.svg",
    color: AppColors.colorWhite,
    height: 60,
  );
}
