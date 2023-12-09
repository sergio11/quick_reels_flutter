import 'package:flutter/material.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/app_bar_title.dart';


//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget  {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;

  const CustomAppBar({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
      title: AppBarTitle(text: appBarTitleText),
    );
  }
}
