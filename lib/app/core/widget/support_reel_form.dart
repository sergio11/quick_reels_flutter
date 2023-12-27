import 'package:flutter/material.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/values/text_styles.dart';
import 'package:quickreels/app/core/widget/tags_row.dart';
import 'package:quickreels/app/core/widget/text_field_input.dart';
import 'package:quickreels/app/core/widget/video_preview.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class SupportReelForm extends StatefulWidget {
  final TextEditingController descriptionController;
  final TextEditingController placeInfoController;
  final TextfieldTagsController textFieldTagsController;

  const SupportReelForm(
      {Key? key,
      required this.descriptionController,
      required this.placeInfoController,
      required this.textFieldTagsController})
      : super(key: key);
}

abstract class SupportReelFormState<T extends SupportReelForm>
    extends State<T> {
  AppLocalizations? appLocalizations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.6,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          appLocalizations?.reelFormTitle ?? "",
                          style: whiteText18,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ...onBuildCustomWidgets(),
                      const SizedBox(
                        height: 10,
                      ),
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

  List<Widget> onBuildCustomWidgets() => [];

  Widget onBuildReelPreview();

  Widget _buildPlaceInfoTextInput() {
    return TextFieldInput(
      hintText: appLocalizations?.reelFormPlaceInformationText ?? "",
      textInputType: TextInputType.text,
      icon: const Icon(Icons.location_on),
      textEditingController: widget.placeInfoController,
      maxLines: 1,
    );
  }

  Widget _buildDescriptionTextInput() {
    return TextFieldInput(
      hintText: appLocalizations?.reelFormDescriptionText ?? "",
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
            return appLocalizations?.reelFormTagAlreadyAdded;
          }
          return null;
        },
        inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
          return ((context, sc, tags, onTagDelete) {
            return TextFieldInput(
                textEditingController: tec,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                errorTextColor: AppColors.colorWhite,
                hintText: widget.textFieldTagsController.hasTags
                    ? ''
                    : appLocalizations?.reelFormAdTagHintText ?? "",
                helperText: appLocalizations?.reelFormAdTagHelperText ?? "",
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
    return VideoPreview(videoPath: videoPath);
  }
}
