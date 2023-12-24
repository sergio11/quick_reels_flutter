import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/features/upload/controller/upload_reel_controller.dart';
import 'package:quickreels/app/features/upload/model/upload_reel_ui_data.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:quickreels/app/features/upload/views/create_reel_form.dart';

class UploadReelScreen
    extends BaseView<UploadReelController, UploadReelUiState> {
  final VoidCallback onPostUploaded;
  final VoidCallback onBackPressed;

  UploadReelScreen({required this.onPostUploaded, required this.onBackPressed});

  @override
  PreferredSizeWidget? appBar(BuildContext context, UploadReelUiState uiData) {
    return uiData.videoFilePath != null
        ? AppBar(
            backgroundColor: AppColors.backgroundColor,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: AppColors.colorWhite,
                onPressed: _onBackPressed),
            title: Text("Upload Reel",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.colorWhite)),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                onPressed: () => controller.uploadReel(),
                icon: const Icon(Icons.upload, color: AppColors.colorWhite,),
              )
            ],
          )
        : null;
  }

  @override
  Widget body(BuildContext context, UploadReelUiState uiData) {
    return _buildScreenContent(uiData);
  }

  Widget _buildScreenContent(UploadReelUiState uiData) {
    return uiData.videoFilePath != null
        ? _buildFillReelData(uiData)
        : _buildTakeContentFromCamera(uiData);
  }

  Widget _buildTakeContentFromCamera(UploadReelUiState uiData) {
    return CameraAwesomeBuilder.awesome(
      saveConfig: SaveConfig.video(),
      sensorConfig: SensorConfig.single(
        flashMode: FlashMode.auto,
        aspectRatio: CameraAspectRatios.ratio_16_9,
      ),
      theme: AwesomeTheme(
        bottomActionsBackgroundColor: AppColors.colorPrimary.withOpacity(0.5),
        buttonTheme: AwesomeButtonTheme(
          backgroundColor: AppColors.colorPrimary.withOpacity(0.5),
          // Size of the icon
          iconSize: 22,
          // Padding around the icon
          padding: const EdgeInsets.all(18),
          foregroundColor: AppColors.colorWhite,
          buttonBuilder: (child, onTap) {
            return ClipOval(
              child: Material(
                color: Colors.transparent,
                shape: const CircleBorder(),
                child: InkWell(
                  splashColor: AppColors.colorPrimary,
                  highlightColor: AppColors.colorPrimary.withOpacity(0.5),
                  onTap: onTap,
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
      onMediaTap: (mediaCapture) {
        final filePath = mediaCapture.captureRequest
            .when(single: (single) => single.file?.path);
        if (filePath != null) {
          controller.videoSelected(filePath);
        }
      },
    );
  }

  Widget _buildFillReelData(UploadReelUiState uiData) {
    return CreateReelForm(
        descriptionController: controller.descriptionController,
        placeInfoController: controller.placeInfoController,
        textFieldTagsController: controller.textFieldTagsController,
        videoFilePath: uiData.videoFilePath);
  }

  void _onReelUploaded() {
    showAlertDialog(
        context: context,
        title: "_l10n.postUploadedAlertTitle",
        description: "_l10n.postUploadedAlertDescription",
        onAcceptPressed: onPostUploaded);
  }

  void _onBackPressed() {
    showConfirmDialog(
        context: context,
        title: "_l10n.cancelUploadPostAlertTitle",
        description: "_l10n.cancelUploadPostAlertDescription",
        onAcceptPressed: onBackPressed);
  }
}
