import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/common_button.dart';
import 'package:quickreels/app/core/widget/common_onboarding_container.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatefulWidget {
  final VoidCallback onSignInPressed;
  final VoidCallback onSignUpPressed;

  const OnBoardingScreen(
      {Key? key, required this.onSignInPressed, required this.onSignUpPressed})
      : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset("assets/videos/onboarding_video.mp4")
          ..initialize().then((_) {
            // Once the video has been loaded we play the video and set looping to true.
            _videoController.play();
            _videoController.setLooping(true);
            // Ensure the first frame is shown after the video is initialized.
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [_buildVideoBackground(), _buildScreenContent()],
        ));
  }

  Widget _buildVideoBackground() {
    return SizedBox.expand(
        child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoController.value.size.width,
              height: _videoController.value.size.height,
              child: VideoPlayer(_videoController),
            )));
  }

  Widget _buildScreenContent() {
    return CommonOnBoardingContainer(
      children: [
        const SizedBox(
          height: 0,
        ),
        _buildMainLogo(),
        _buildCarouselSlider(),
        _buildActions(),
        _buildFooter()
      ]);
  }

  Widget _buildMainLogo() {
    return SvgPicture.asset(
      'assets/images/main_logo.svg',
      color: AppColors.colorWhite,
      height: 80,
    );
  }

  Widget _buildCarouselSlider() {
    final l10n = AppLocalizations.of(context);
    return CarouselSlider(
      options: CarouselOptions(
          height: 250.0,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0),
      items: [
        {
          "image": "discover.png",
          "title": "Discover QuickReels",
          "text": "Experience QuickReels: Your gateway to a vast entertainment universe. Discover, indulge, and enjoy limitless content, tailored just for you.",
        },
        {
          "image": "explore.png",
          "title": "Explore Collections",
          "text": "Uncover curated collections made just for you. Explore tailored assortments, uniquely crafted to match your preferences.",
        },
        {
          "image": "favorites.png",
          "title": "Save Favorites",
          "text": "Bookmark your preferred videos for later viewing. Keep your favorites handy, ready for your leisure time.",
        },
        {
          "image": "share.png",
          "title": "Share & Follow",
          "text": "Engage and connect by sharing experiences, and follow fellow users for more interaction.",
        }
      ].map((slideItem) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/${slideItem["image"]!}",
                      height: 50,
                      color: AppColors.colorWhite,
                    ),
                    const SizedBox(height: 25,),
                    Text(slideItem["title"]!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.colorWhite, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20,),
                    Text(slideItem["text"]!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.colorWhite,
                              fontWeight: FontWeight.w500,
                            ))
                  ],
                ));
          },
        );
      }).toList(),
    );
  }

  Widget _buildActions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_buildSignInButton(), _buildSignUpButton()],
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child:
          Text("Build with passion by dreamsoftware \n Sergio Sánchez © 2023",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.colorWhite,
                    fontWeight: FontWeight.bold,
                  )),
    );
  }

  Widget _buildSignInButton() {
    return CommonButton(
      text: "Sign In",
      textColor: AppColors.colorWhite,
      borderColor: AppColors.colorWhite,
      onPressed: widget.onSignInPressed,
      styleType: CommonButtonStyleType.reverse,
      sizeType: CommonButtonSizeType.large,
    );
  }

  Widget _buildSignUpButton() {
    return CommonButton(
      text: "Sign Up",
      textColor: AppColors.colorWhite,
      borderColor: AppColors.colorWhite,
      onPressed: widget.onSignUpPressed,
      sizeType: CommonButtonSizeType.large,
    );
  }
}
