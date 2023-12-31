import 'package:flutter/material.dart';
import 'package:quickreels/app/core/values/app_colors.dart';

enum CommonButtonSizeType { tiny, small, medium, large }

enum CommonButtonStyleType { standard, reverse, danger }

class CommonButton extends StatelessWidget {
  static const double defaultTinyButtonWidth = 120;
  static const double defaultTinyButtonHeight = 35;
  static const double defaultSmallButtonWidth = 150;
  static const double defaultSmallButtonHeight = 40;
  static const double defaultMediumButtonWidth = 240;
  static const double defaultMediumButtonHeight = 50;
  static const double defaultLargeButtonWidth = 250;
  static const double defaultLargeButtonHeight = 50;

  final Function()? onPressed;
  final Color borderColor;
  final String text;
  final Color textColor;
  final CommonButtonSizeType sizeType;
  final CommonButtonStyleType styleType;
  final bool isDisabled;

  const CommonButton(
      {Key? key,
      this.borderColor = AppColors.colorPrimary,
      required this.text,
      required this.textColor,
      this.sizeType = CommonButtonSizeType.medium,
      this.styleType = CommonButtonStyleType.standard,
      this.onPressed,
      this.isDisabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            height: switch (sizeType) {
              CommonButtonSizeType.tiny => defaultTinyButtonHeight,
              CommonButtonSizeType.small => defaultSmallButtonHeight,
              CommonButtonSizeType.medium => defaultMediumButtonHeight,
              CommonButtonSizeType.large => defaultLargeButtonHeight
            },
            width: switch (sizeType) {
              CommonButtonSizeType.tiny => defaultTinyButtonWidth,
              CommonButtonSizeType.small => defaultSmallButtonWidth,
              CommonButtonSizeType.medium => defaultMediumButtonWidth,
              CommonButtonSizeType.large => defaultLargeButtonWidth
            },
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 5.0)
              ],
              border: !isDisabled
                  ? Border.all(color: borderColor, width: 3)
                  : null,
              gradient: !isDisabled
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.0, 1.0],
                      colors: switch (styleType) {
                        CommonButtonStyleType.standard => [
                            AppColors.colorDark,
                            AppColors.colorShadow
                          ],
                        CommonButtonStyleType.reverse => [
                            AppColors.colorPrimary,
                            AppColors.colorPrimaryMedium
                          ],
                        CommonButtonStyleType.danger => [
                            Colors.redAccent,
                            AppColors.colorPrimary
                          ]
                      })
                  : null,
              color: AppColors.colorSecondaryExtraLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              onPressed: isDisabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      defaultSmallButtonWidth, defaultSmallButtonHeight),
                  maximumSize: const Size(
                      defaultLargeButtonWidth, defaultLargeButtonHeight),
                  padding: const EdgeInsets.all(0),
                  foregroundColor: textColor,
                  disabledBackgroundColor: AppColors.colorAccent,
                  disabledForegroundColor: AppColors.colorPrimary,
                  fixedSize: switch (sizeType) {
                    CommonButtonSizeType.tiny => const Size(
                        defaultTinyButtonWidth, defaultTinyButtonHeight),
                    CommonButtonSizeType.small => const Size(
                        defaultSmallButtonWidth, defaultSmallButtonHeight),
                    CommonButtonSizeType.medium => const Size(
                        defaultMediumButtonWidth, defaultMediumButtonHeight),
                    CommonButtonSizeType.large => const Size(
                        defaultLargeButtonWidth, defaultLargeButtonHeight)
                  },
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  textStyle: getTextStyle(context, sizeType)),
              child: Text(
                text,
              ),
            )));
  }

  TextStyle? getTextStyle(BuildContext context, CommonButtonSizeType sizeType) {
    final textTheme = Theme.of(context).textTheme;
    final style = switch (sizeType) {
      CommonButtonSizeType.tiny => textTheme.labelSmall,
      CommonButtonSizeType.small => textTheme.labelSmall,
      CommonButtonSizeType.medium => textTheme.labelMedium,
      CommonButtonSizeType.large => textTheme.labelLarge
    };
    return style?.copyWith(color: textColor, fontWeight: FontWeight.bold);
  }
}
