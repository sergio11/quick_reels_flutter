import 'package:audio_wave/audio_wave.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/circle_animation.dart';
import 'package:quickreels/app/core/widget/common_screen_progress_indicator.dart';
import 'package:quickreels/app/core/widget/icon_action_animation.dart';
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
  bool isLikeAnimating = false;

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

  void _startLikeAnimation() {
    setState(() {
      isLikeAnimating = true;
    });
    widget.onReelLiked();
  }

  void _stopLikeAnimation() {
    setState(() {
      isLikeAnimating = false;
    });
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
      children: [_buildVideoController(context), _buildReelScreen(context)],
    );
  }

  Widget _buildReelScreen(BuildContext context) {
    return GestureDetector(
        child: Stack(alignment: Alignment.center, children: [
          Row(
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
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isLikeAnimating ? 1 : 0,
            child: IconActionAnimation(
              isAnimating: isLikeAnimating,
              duration: const Duration(
                milliseconds: 400,
              ),
              onEnd: () => _stopLikeAnimation(),
              child: const Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 100,
              ),
            ),
          )
        ]),
        onDoubleTap: () => _startLikeAnimation());
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
          color: AppColors.colorDark,
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
          _buildLikeActionButton(),
          const SizedBox(height: 5),
          _buildCommentsAction(),
          const SizedBox(height: 5),
          _buildShareAction(),
          const SizedBox(height: 20),
          _buildProfileImage(widget.reel.authImageUrl),
        ],
      ),
    );
  }

  Widget _buildActionColumn(
    IconData icon,
    int count,
    VoidCallback onTap,
    bool isIconButton,
    bool isLiked,
  ) {
    return Column(
      children: [
        isIconButton
            ? IconActionAnimation(
                isAnimating: isLikeAnimating,
                duration: const Duration(
                  milliseconds: 400,
                ),
                onEnd: () => _stopLikeAnimation(),
                child: IconButton(
                  icon: Icon(
                    icon,
                    size: 30,
                    color: isLiked
                        ? AppColors.colorPrimaryMedium
                        : AppColors.colorWhite,
                  ),
                  onPressed: onTap,
                ),
              )
            : InkWell(
                onTap: onTap,
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
        Text(
          count.toString(),
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: AppColors.colorWhite),
        )
      ],
    );
  }

  Widget _buildLikeActionButton() {
    bool isLiked = widget.reel.likes.contains(widget.authUserUuid);
    return _buildActionColumn(
        isLiked ? Icons.favorite : Icons.favorite_border,
        widget.reel.likes.length,
        _startLikeAnimation,
        true,
        isLiked);
  }

  Widget _buildCommentsAction() {
    return _buildActionColumn(Icons.comment, widget.reel.commentCount,
        widget.onGoToComments, false, false);
  }

  Widget _buildShareAction() {
    return _buildActionColumn(
        Icons.reply, widget.reel.shareCount, () {}, false, false);
  }
}
