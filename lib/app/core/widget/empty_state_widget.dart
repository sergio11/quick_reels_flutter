import 'package:flutter/material.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/common_button.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData iconData;
  final VoidCallback? onRetry;

  const EmptyStateWidget({
    Key? key,
    required this.message,
    required this.iconData,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 120.0,
            color: AppColors.colorWhite,
          ),
          const SizedBox(height: 5,),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.colorWhite),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8,),
          if (onRetry != null)
            CommonButton(
              text: "Retry",
              textColor: AppColors.colorWhite,
              borderColor: AppColors.colorWhite,
              onPressed: onRetry,
              sizeType: CommonButtonSizeType.small,
            ),
        ],
      ),
    );
  }
}