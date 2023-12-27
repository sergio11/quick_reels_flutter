import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/repository/auth_repository.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';

class PublishReelUseCase extends BaseUseCase<bool, PublishReelUseParams> {
  final AuthRepository authRepository;
  final ReelRepository reelRepository;

  PublishReelUseCase(
      {required this.authRepository, required this.reelRepository});

  @override
  Future<bool> call(PublishReelUseParams param) async {
    final authUserUid = await authRepository.getAuthUserUid();
    return await reelRepository.upload(
        authorUid: authUserUid,
        description: param.description,
        file: param.file,
        tags: param.tags,
        placeInfo: param.placeInfo,
        songId: param.songId);
  }
}

class PublishReelUseParams extends Equatable {
  final String description;
  final Uint8List file;
  final List<String> tags;
  final String? placeInfo;
  final String songId;

  const PublishReelUseParams(
      {required this.description,
      required this.file,
      required this.tags,
      required this.placeInfo,
      required this.songId});

  @override
  List<Object> get props => [description, tags, songId];
}
