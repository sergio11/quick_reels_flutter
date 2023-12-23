import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/values/app_colors.dart';

class AvatarInputSelector extends StatelessWidget {
  final Uint8List? avatarImageData;
  final String? currentImageUrl;
  final VoidCallback onPickUpImageFromGallery;

  const AvatarInputSelector(
      {super.key,
      required this.onPickUpImageFromGallery,
      this.avatarImageData,
      this.currentImageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorPrimary, width: 2),
            shape: BoxShape.circle,
            color: AppColors.colorSecondaryExtraLight.withOpacity(0.5),
          ),
          alignment: Alignment.center,
          child: avatarImageData != null
              ? _buildUserPicture(avatarImageData!)
              : currentImageUrl != null
                  ? _buildCurrentUserPicture(currentImageUrl!)
                  : _buildDefaultAvatarImage()),
      Positioned(
        bottom: 0,
        left: 100,
        child: Container(
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.colorSecondaryExtraLight, width: 1),
              shape: BoxShape.circle,
              color: AppColors.colorPrimary,
            ),
            child: IconButton(
              iconSize: 20,
              onPressed: () => onPickUpImageFromGallery(),
              icon: const Icon(Icons.add_a_photo,
                  color: AppColors.colorSecondaryExtraLight),
            )),
      )
    ]);
  }

  Widget _buildUserPicture(Uint8List avatarImageData) {
    return CircleAvatar(
      radius: 100,
      backgroundImage: MemoryImage(avatarImageData),
      backgroundColor: AppColors.colorPrimary,
    );
  }

  Widget _buildCurrentUserPicture(String profilePictureUrl) {
    return buildCircleImage(
        imageUrl: profilePictureUrl, radius: 100, showBackgroundColor: false);
  }

  Widget _buildDefaultAvatarImage() {
    return const Icon(
      Icons.person,
      color: AppColors.colorPrimary,
      size: 100,
    );
  }
}
