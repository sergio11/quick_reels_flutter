import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quickreels/app/core/values/app_colors.dart';

class CommonScreenProgressIndicator extends StatelessWidget {

  static const double DEFAULT_SPINNER_SIZE = 60.0;

  final Color backgroundColor;
  final Color spinnerColor;
  final double spinnerSize;

  const CommonScreenProgressIndicator({
    super.key,
    this.backgroundColor = AppColors.colorWhite,
    this.spinnerColor = AppColors.colorPrimary,
    this.spinnerSize = DEFAULT_SPINNER_SIZE
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
          child: SpinKitChasingDots(
            color: spinnerColor,
            size: spinnerSize,
          )),
    );
  }

}