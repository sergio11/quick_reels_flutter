import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/usecase/fetch_geolocation_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/publish_reel_use_case.dart';
import 'package:quickreels/app/features/upload/model/upload_reel_ui_data.dart';
import 'package:textfield_tags/textfield_tags.dart';

class UploadReelController extends BaseController<UploadReelUiState> {
  final PublishReelUseCase publishReelUseCase;
  final FetchGeolocationDetailsUseCase fetchGeolocationDetailsUseCase;

  late TextEditingController descriptionController;
  late TextEditingController placeInfoController;
  late TextfieldTagsController textFieldTagsController;

  final _isReelUploadedController = false.obs;
  bool get isReelUploaded => _isReelUploadedController.value;

  UploadReelController(
      {required this.publishReelUseCase,
      required this.fetchGeolocationDetailsUseCase})
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

  void videoSelected(String videoFilePath) async {
    updateState(uiData.copyWith(videoFilePath: videoFilePath));
    callUseCase(fetchGeolocationDetailsUseCase(const DefaultParams()),
        onSuccess: (placeDetails) {
      placeInfoController.text =
          "${placeDetails.locality}, ${placeDetails.administrativeArea}, ${placeDetails.country}";
    });
  }

  void uploadReel() async {
    if (uiData.videoFilePath != null) {
      callUseCase(
          publishReelUseCase(PublishReelUseParams(
              description: descriptionController.text,
              file: await File(uiData.videoFilePath!).readAsBytes(),
              tags: textFieldTagsController.getTags ?? [],
              placeInfo: placeInfoController.text)), onComplete: (isSuccess) {
        _isReelUploadedController.value = isSuccess;
      });
    } else {
      showErrorMessage(
          "An error occurred when trying to upload reel, please try again!");
    }
  }

  void clearData() async {
    updateState(uiData.copyWith(videoFilePath: null));
  }
}
