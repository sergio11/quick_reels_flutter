import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class VideoPreview extends StatefulWidget {
  final String videoPath;

  const VideoPreview({required this.videoPath});

  @override
  _VideoPreviewState createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late VideoPlayerController _videoController;
  late StreamSubscription<bool> _keyboardSubscription;

  @override
  void initState() {
    _initializeVideoPlayer();
    var keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        if (_videoController.value.isPlaying == true) {
          _videoController.pause();
        }
      } else {
        if (_videoController.value.isPlaying == false) {
          _videoController.play();
        }
      }
    });
    super.initState();
  }

  void _initializeVideoPlayer() {
    _videoController = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {
          _videoController.play();
          _videoController.setVolume(1);
          _videoController.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _keyboardSubscription.cancel();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoController.value.isInitialized
        ? AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
