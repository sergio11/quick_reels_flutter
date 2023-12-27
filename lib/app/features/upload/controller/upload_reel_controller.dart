import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/core/utils/app_event_bus.dart';
import 'package:quickreels/app/core/utils/extensions.dart';
import 'package:quickreels/app/domain/usecase/fetch_geolocation_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/publish_reel_use_case.dart';
import 'package:quickreels/app/features/shared/events/events.dart';
import 'package:quickreels/app/features/upload/model/upload_reel_ui_data.dart';
import 'package:textfield_tags/textfield_tags.dart';

class UploadReelController extends BaseController<UploadReelUiState> {
  final PublishReelUseCase publishReelUseCase;
  final FetchGeolocationDetailsUseCase fetchGeolocationDetailsUseCase;
  final AppEventBus eventBus;

  late TextEditingController descriptionController;
  late TextEditingController placeInfoController;
  late TextfieldTagsController textFieldTagsController;

  final _isReelUploadedController = false.obs;
  bool get isReelUploaded => _isReelUploadedController.value;

  UploadReelController(
      {required this.publishReelUseCase,
      required this.fetchGeolocationDetailsUseCase,
      required this.eventBus})
      : super(initialUiState: const UploadReelUiState());

  @override
  void onInit() {
    super.onInit();
    descriptionController = TextEditingController();
    placeInfoController = TextEditingController();
    textFieldTagsController = TextfieldTagsController();
  }

  @override
  void onClose() {
    descriptionController.clear();
    descriptionController.dispose();
    placeInfoController.clear();
    placeInfoController.dispose();
    textFieldTagsController.clearTags();
    textFieldTagsController.dispose();
    super.onClose();
  }

  void pickFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null && pickedImage.path.isValidVideoExtension()) {
      final pickedFileImage = pickedImage.path;
      final pickedFileImageData = File(pickedFileImage).readAsBytesSync();
      updateState(uiData.copyWith(
          videoFilePath: pickedFileImage, videoImageData: pickedFileImageData));
    } else {
      showErrorMessage(
          'Please, select a valid video file, only MP4 and MOV formats are allowed');
    }
  }

  void videoSelectedFromCamera(String videoFilePath) async {
    final videoFileData = await File(videoFilePath).readAsBytes();
    updateState(uiData.copyWith(
        videoFilePath: videoFilePath, videoImageData: videoFileData));
    callUseCase(fetchGeolocationDetailsUseCase(const DefaultParams()),
        onSuccess: (placeDetails) {
      placeInfoController.text =
          "${placeDetails.locality}, ${placeDetails.administrativeArea}, ${placeDetails.country}";
    });
  }

  void uploadReel() async {
    if (uiData.videoFilePath != null && uiData.videoImageData != null) {
      callUseCase(
          publishReelUseCase(PublishReelUseParams(
              description: descriptionController.text,
              file: uiData.videoImageData!,
              tags: textFieldTagsController.getTags ?? [],
              placeInfo: placeInfoController.text)), onComplete: (isSuccess) {
        _isReelUploadedController.value = isSuccess;
      });
    } else {
      showErrorMessage(
          "An error occurred when trying to upload reel, please try again!");
    }
  }

  void onCancelProcess() async {
    _clearState();
    eventBus.sendEvent(UploadReelProcessCanceledEvent());
  }

  void onCompleteProcess() async {
    _clearState();
    eventBus.sendEvent(ReelUploadedEvent());
  }

  void _clearState() async {
    _isReelUploadedController.value = false;
    updateState(uiData.copyWith(videoFilePath: null, videoImageData: null));
  }
}
