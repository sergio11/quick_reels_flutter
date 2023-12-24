import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/tags_row.dart';
import 'package:quickreels/app/core/widget/text_field_input.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class SupportReelForm extends StatefulWidget {
  final TextEditingController descriptionController;
  final TextEditingController placeInfoController;
  final TextfieldTagsController textFieldTagsController;

  const SupportReelForm({
    Key? key,
    required this.descriptionController,
    required this.placeInfoController,
    required this.textFieldTagsController
  }) : super(key: key);
}

abstract class SupportReelFormState<T extends SupportReelForm>
    extends State<T> {
  late StreamSubscription<bool> _keyboardSubscription;
  VideoPlayerController? _videoController;
  AppLocalizations? _appLocalizations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appLocalizations = AppLocalizations.of(context);
  }

  @override
  void initState() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
          if (visible) {
            if (_videoController?.value.isPlaying == true) {
              _videoController?.pause();
            }
          } else {
            if (_videoController != null &&
                _videoController?.value.isPlaying == false) {
              _videoController?.play();
            }
          }
        });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _keyboardSubscription.cancel();
    _videoController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.5,
          floating: false,
          pinned: false,
          flexibleSpace: Stack(
            children: [
              FlexibleSpaceBar(
                background: onBuildReelPreview(),
              ),
              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: Container(
                  height: 65,
                  decoration: const BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.colorDark,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 1),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                color: AppColors.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: _buildPlaceInfoTextInput(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: _buildTagsTextInput(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: _buildDescriptionTextInput(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget onBuildReelPreview();

  Widget _buildPlaceInfoTextInput() {
    return TextFieldInput(
      hintText: _appLocalizations?.reelFormPlaceInformationText ?? "",
      textInputType: TextInputType.text,
      icon: const Icon(Icons.location_on),
      textEditingController: widget.placeInfoController,
      maxLines: 1,
    );
  }

  Widget _buildDescriptionTextInput() {
    return TextFieldInput(
      hintText: _appLocalizations?.reelFormDescriptionText ?? "",
      textInputType: TextInputType.multiline,
      textEditingController: widget.descriptionController,
      maxLines: 5,
    );
  }

  Widget _buildTagsTextInput() {
    return TextFieldTags(
        textfieldTagsController: widget.textFieldTagsController,
        textSeparators: const [' ', ','],
        letterCase: LetterCase.normal,
        validator: (String tag) {
          if (widget.textFieldTagsController.getTags?.contains(tag) == true) {
            return _appLocalizations?.reelFormTagAlreadyAdded;
          }
          return null;
        },
        inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
          return ((context, sc, tags, onTagDelete) {
            return TextFieldInput(
                textEditingController: tec,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                hintText: widget.textFieldTagsController.hasTags
                    ? ''
                    : _appLocalizations?.reelFormAdTagHintText ?? "",
                helperText: _appLocalizations?.reelFormAdTagHelperText ?? "",
                focusNode: fn,
                errorText: error,
                prefixIconConstraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.74),
                icon: tags.isNotEmpty
                    ? TagsRow(tags: tags, onTagDeleted: onTagDelete)
                    : null);
          });
        });
  }

  Widget buildVideoPreview(String videoPath) {
    if (_videoController == null) {
      _videoController = VideoPlayerController.file(File(videoPath));
      _videoController?.initialize();
      _videoController?.play();
      _videoController?.setVolume(1);
      _videoController?.setLooping(true);
    }
    return VideoPlayer(_videoController!);
  }
}