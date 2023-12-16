import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/circle_animation.dart';
import 'package:quickreels/app/core/widget/reel_player_item.dart';
import 'package:quickreels/app/core/widget/tags_row.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/features/home/controller/home_controller.dart';
import 'package:quickreels/app/features/home/model/home_ui_data.dart';

class HomeScreen extends BaseView<HomeController, HomeUiData> {
  final VoidCallback onGoToComments;

  HomeScreen({required this.onGoToComments});

  @override
  Widget body(BuildContext context, uiData) {
    return SafeArea(child: _buildScreenContent(context, uiData));
  }

  Widget _buildScreenContent(BuildContext context, HomeUiData uiData) {
    return PageView.builder(
      itemCount: uiData.reels.length,
      controller: PageController(initialPage: 0, viewportFraction: 1),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final reel = uiData.reels[index];
        return Stack(
          children: [
            ReelPlayerItem(
              reel: reel,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 100, left: 20, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildReelAuthorInfo(reel),
                      _buildSongData(reel),
                    ],
                  ),
                )),
                _buildReelActions(reel, uiData.authUserUuid),
              ],
            ))
          ],
        );
      },
    );
  }

  Widget _buildReelAuthorInfo(ReelBO reelBO) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          reelBO.username,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          reelBO.description,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        TagsRow(tags: reelBO.tags),
      ],
    );
  }

  Widget _buildSongData(ReelBO reelBO) {
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
              reelBO.songName,
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

  Widget _buildReelActions(ReelBO reelBO, String authUserUuid) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () => controller.likeReel(reelBO.reelId),
                child: Icon(
                  Icons.favorite,
                  size: 30,
                  color: reelBO.likes.contains(authUserUuid)
                      ? Colors.red
                      : Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                reelBO.likes.length.toString(),
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
                onTap: onGoToComments,
                child: const Icon(
                  Icons.comment,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                reelBO.commentCount.toString(),
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
                reelBO.shareCount.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          _buildProfileImage(reelBO.authImageUrl),
        ],
      ),
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
}
