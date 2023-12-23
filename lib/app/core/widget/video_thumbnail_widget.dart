import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/common_screen_progress_indicator.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailWidget extends StatefulWidget {
  final String videoUrl;

  const VideoThumbnailWidget({super.key, required this.videoUrl});

  @override
  VideoThumbnailWidgetState createState() => VideoThumbnailWidgetState();
}

class VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  String? thumbnailFileName;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    final thumbnailFileName = await _getThumbnailFileName();
    if (thumbnailFileName != null) {
      setState(() {
        this.thumbnailFileName = thumbnailFileName;
      });
    }
  }

  Future<String?> _getThumbnailFileName() async {
    final directory = await getTemporaryDirectory();
    final thumbnailPath = directory.path;
    final filePath = '$thumbnailPath/${_getFileNameFromUrl()}';
    final file = File(filePath);

    if (await file.exists()) {
      return filePath;
    } else {
      return await _generateNewThumbnail(thumbnailPath);
    }
  }

  Future<String?> _generateNewThumbnail(String thumbnailPath) async {
    final newFileName = await VideoThumbnail.thumbnailFile(
      video: widget.videoUrl,
      thumbnailPath: thumbnailPath,
      imageFormat: ImageFormat.JPEG,
    );

    if (mounted) {
      return newFileName;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return thumbnailFileName != null
        ? FittedBox(
            fit: BoxFit.fill,
            child: Image(image: FileImage(File(thumbnailFileName!))))
        : const CommonScreenProgressIndicator(
            backgroundColor: AppColors.backgroundColor,
          );
  }

  String _getFileNameFromUrl() {
    Uri uri = Uri.parse(widget.videoUrl);
    String fileName = uri.pathSegments.last;
    int extensionIndex = fileName.lastIndexOf('.');
    fileName =
        extensionIndex != -1 ? fileName.substring(0, extensionIndex) : fileName;
    return "$fileName.jpg";
  }
}
