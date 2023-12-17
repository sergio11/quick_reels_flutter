import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/common_dialog_box.dart';
import 'package:quickreels/app/core/widget/reel_preview_widget.dart';
import 'package:quickreels/app/domain/model/reel.dart';

// for picking up image from gallery
pickImageAsBytes(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
}

Future<XFile?> pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  return await imagePicker.pickImage(source: source);
}

disableSystemUI() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

enableSystemUI() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.statusBarColor /*Android=23*/,
    statusBarBrightness: Brightness.light /*iOS*/,
    statusBarIconBrightness: Brightness.dark /*Android=23*/,
    systemStatusBarContrastEnforced: false /*Android=29*/,
    systemNavigationBarColor: AppColors.colorPrimary /*Android=27*/,
    systemNavigationBarDividerColor: AppColors.colorPrimary /*Android=28 */,
    systemNavigationBarIconBrightness: Brightness.dark /*Android=27*/,
    systemNavigationBarContrastEnforced: false /*Android=29*/,
  ));
}

hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

showErrorSnackBar({required BuildContext context, required String message}) {
  showSnackBar(
      context: context,
      title: "Oh Hey!!",
      message: message,
      contentType: ContentType.failure);
}

showSnackBar(
    {required BuildContext context,
    required String title,
    required String message,
    required ContentType contentType}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: contentType,
      ),
    ));
}

showAlertDialog(
    {required BuildContext context,
    required String title,
    required String description,
    Function()? onAcceptPressed}) {
  showDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (BuildContext context) {
        return CommonDialogBox(
          title: title,
          descriptions: description,
          acceptText: "Accept",
          img: buildAppLogo(),
          onAccepted: onAcceptPressed,
        );
      });
}

showConfirmDialog(
    {required BuildContext context,
    required String title,
    required String description,
    Function()? onAcceptPressed,
    Function()? onCancelPressed}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonDialogBox(
          title: title,
          descriptions: description,
          acceptText: "Accept",
          cancelledText: "Cancel",
          img: buildAppLogo(),
          onAccepted: onAcceptPressed,
          onCancelled: onCancelPressed,
        );
      });
}

Future<void> showReelPreviewDialog(
    BuildContext context, ReelBO reel, String authUserUuid) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
          insetPadding: EdgeInsets.zero,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ReelsPreview(
                reel: reel,
                authUserUuid: authUserUuid,
              )));
    },
  );
}
