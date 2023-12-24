import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/usecase/fetch_geolocation_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/get_user_details_use_case.dart';
import 'package:quickreels/app/domain/usecase/publish_reel_use_case.dart';
import 'package:quickreels/app/features/upload/model/upload_reel_ui_data.dart';
import 'package:textfield_tags/textfield_tags.dart';

class UploadReelController extends BaseController<UploadReelUiState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final PublishReelUseCase publishReelUseCase;
  final FetchGeolocationDetailsUseCase fetchGeolocationDetailsUseCase;

  late TextEditingController descriptionController;
  late TextEditingController placeInfoController;
  late TextfieldTagsController textFieldTagsController;

  UploadReelController(
      {required this.getUserDetailsUseCase,
      required this.publishReelUseCase,
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
  void onResumed() {
    super.onResumed();
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
        onSuccess: (placeDetails) =>
            updateState(uiData.copyWith(placeDetails: placeDetails)));
  }

  void uploadReel() async {}
}
