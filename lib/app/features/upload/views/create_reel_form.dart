import 'package:flutter/material.dart';
import 'package:quickreels/app/core/widget/support_reel_form.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CreateReelForm extends SupportReelForm {
  final String? videoFilePath;

  const CreateReelForm({
    Key? key,
    required TextEditingController descriptionController,
    required TextEditingController placeInfoController,
    required TextfieldTagsController textFieldTagsController,
    this.videoFilePath,
  }) : super(
      key: key,
      descriptionController: descriptionController,
      placeInfoController: placeInfoController,
      textFieldTagsController: textFieldTagsController);

  @override
  CreateReelFormState createState() => CreateReelFormState();
}

class CreateReelFormState extends SupportReelFormState<CreateReelForm> {

  @override
  Widget onBuildReelPreview() {
    return widget.videoFilePath != null
        ? buildVideoPreview(widget.videoFilePath!)
        : Container();
  }
}