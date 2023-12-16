import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReelPlayerItem extends StatefulWidget {
  final ReelBO reel;
  const ReelPlayerItem({
    Key? key,
    required this.reel,
  }) : super(key: key);

  @override
  ReelPlayerItemState createState() => ReelPlayerItemState();
}

class ReelPlayerItemState extends State<ReelPlayerItem> {
  late AudioPlayer _audioPlayer;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.loop);
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.reel.url), videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
          ..initialize().then((value) {
            _videoPlayerController.setLooping(true);
            _videoPlayerController.setVolume(1);
            _videoPlayerController.addListener(() {
              if (_videoPlayerController.value.isPlaying) {
                _playAudioInLoop(widget.reel.songUrl);
              } else {
                _stopAudio();
              }
            });
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudioInLoop(String audioUrl) async {
    await _audioPlayer.play(UrlSource(audioUrl));
  }

  void _stopAudio() {
    _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: Key(widget.reel.reelId),
      onVisibilityChanged: (visibilityInfo) {
        final isVisible = visibilityInfo.visibleFraction != 0;
        if (isVisible) {
          debugPrint("ReelPlayerItem is Visible");
          _videoPlayerController.play();
        } else {
          debugPrint("ReelPlayerItem is hidden");
          _videoPlayerController.pause();
        }
      },
      child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: VideoPlayer(_videoPlayerController),
      ),
    );
  }
}
