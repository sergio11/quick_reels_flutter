import 'package:flutter/material.dart';
import 'package:quickreels/app/core/utils/extensions.dart';
import 'package:quickreels/app/core/widget/support_reel_form.dart';
import 'package:quickreels/app/core/widget/text_field_input.dart';
import 'package:quickreels/app/domain/model/song.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CreateReelForm extends SupportReelForm {

  final TextEditingController songController;
  final Iterable<SongBO> songs;
  final String? videoFilePath;

  const CreateReelForm({
    Key? key,
    required TextEditingController descriptionController,
    required TextEditingController placeInfoController,
    required TextfieldTagsController textFieldTagsController,
    required this.songController,
    required this.songs,
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

  @override
  List<Widget> onBuildCustomWidgets() => [
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: _buildSongTextInput(),
    )
  ];


  Widget _buildSongTextInput() {
    return TextFieldInput(
      hintText: appLocalizations?.reelFormSongText ?? "",
      textInputType: TextInputType.text,
      icon: const Icon(Icons.music_note),
      textEditingController: widget.songController,
      helperText: appLocalizations?.reelFormSongHelperText ?? "",
      onTap: () => _showDropdown(context),
      readOnly: true,
      maxLines: 1,
    );
  }

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(appLocalizations?.reelFormSongText ?? ""),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
              isExpanded: true,
              value: widget.songs.findSongIdByName(widget.songController.text),
              onChanged: (songIdSelected){
                if(songIdSelected != null) {
                  final songName = widget.songs.findSongNameById(songIdSelected);
                  widget.songController.text = songName;
                }
                Navigator.of(context).pop();
              },
              items: widget.songs.map<DropdownMenuItem<String>>((song) {
                return DropdownMenuItem<String>(
                  value: song.songId,
                  child: Text(song.name),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}