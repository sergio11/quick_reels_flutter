import 'package:audio_wave/audio_wave.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/circle_animation.dart';
import 'package:quickreels/app/core/widget/common_screen_progress_indicator.dart';
import 'package:quickreels/app/core/widget/tags_row.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReelDetailItem extends StatefulWidget {
  final ReelBO reel;
  final String authUserUuid;
  final VoidCallback onGoToComments;
  final VoidCallback onReelLiked;
  final EdgeInsetsGeometry contentPadding;
  const ReelDetailItem(
      {Key? key,
      required this.reel,
      required this.authUserUuid,
      required this.onGoToComments,
      required this.onReelLiked,
      this.contentPadding = const EdgeInsets.all(20)})
      : super(key: key);

  @override
  ReelDetailItemState createState() => ReelDetailItemState();
}

class ReelDetailItemState extends State<ReelDetailItem> {
  late AudioPlayer _audioPlayer;
  late VideoPlayerController _videoPlayerController;
  bool _isVideoPlaying = true;
  bool _isAudioPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()
      ..setReleaseMode(ReleaseMode.loop)
      ..onPlayerStateChanged.listen((PlayerState state) {
        _updateAudioPlayingState(state == PlayerState.playing);
      });
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.reel.url),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((value) {
        _videoPlayerController.setLooping(true);
        _videoPlayerController.setVolume(1);
        _videoPlayerController.addListener(() {
          if (!_videoPlayerController.value.isInitialized ||
              _videoPlayerController.value.isBuffering) {
            _updateVideoPlayingState(false);
          } else if (_videoPlayerController.value.isPlaying) {
            _updateVideoPlayingState(true);
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

  void _updateVideoPlayingState(bool isPlaying) {
    if (_isVideoPlaying != isPlaying) {
      setState(() {
        _isVideoPlaying = isPlaying;
      });
    }
  }

  void _updateAudioPlayingState(bool isPlaying) {
    if (_isAudioPlaying != isPlaying) {
      setState(() {
        _isAudioPlaying = isPlaying;
      });
    }
  }

  void _playAudioInLoop(String audioUrl) async {
    await _audioPlayer.play(UrlSource(audioUrl));
  }

  void _stopAudio() {
    _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildVideoController(context),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: widget.contentPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildReelAuthorInfo(),
                  if (_isAudioPlaying) _buildSongData(),
                ],
              ),
            )),
            _buildReelActions(),
          ],
        ))
      ],
    );
  }

  Widget _buildVideoController(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: Key(widget.reel.reelId),
      onVisibilityChanged: (visibilityInfo) {
        final isVisible = visibilityInfo.visibleFraction != 0;
        if (isVisible) {
          _videoPlayerController.play();
        } else {
          _videoPlayerController.pause();
        }
      },
      child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: _isVideoPlaying
            ? VideoPlayer(_videoPlayerController)
            : const CommonScreenProgressIndicator(),
      ),
    );
  }

  Widget _buildReelAuthorInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          widget.reel.username,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          widget.reel.description,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        TagsRow(tags: widget.reel.tags),
      ],
    );
  }

  Widget _buildSongData() {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.music_note,
              size: 30,
              color: Colors.white,
            ),
            Text(
              widget.reel.songName,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.colorWhite,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        LayoutBuilder(
          builder: (context, constraints) {
            return AudioWave(
              height: 40,
              width: constraints.maxWidth,
              spacing: 2.5,
              animationLoop: 0,
              bars: List.generate(30, (index) {
                final heightFactor =
                    [0.7, 0.8, 1, 0.9, 0.5, 0.4, 0.35, 0.6][index % 8];
                return AudioWaveBar(
                  heightFactor: heightFactor.toDouble(),
                  color: AppColors.colorWhite,
                );
              }),
            );
          },
        )
      ],
    );
  }

  Widget _buildProfileImage(String authImageUrl) {
    return CircleAnimation(
      child: SizedBox(
        width: 60,
        height: 60,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.grey,
                        Colors.white,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: buildCircleImage(imageUrl: authImageUrl, radius: 25))
          ],
        ),
      ),
    );
  }

  Widget _buildReelActions() {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              InkWell(
                onTap: widget.onReelLiked,
                child: Icon(
                  Icons.favorite,
                  size: 30,
                  color: widget.reel.likes.contains(widget.authUserUuid)
                      ? Colors.red
                      : Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.reel.likes.length.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: widget.onGoToComments,
                child: const Icon(
                  Icons.comment,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.reel.commentCount.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.reply,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.reel.shareCount.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          _buildProfileImage(widget.reel.authImageUrl),
        ],
      ),
    );
  }
}
