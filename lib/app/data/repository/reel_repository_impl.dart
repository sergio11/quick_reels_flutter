import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/comment_dto.dart';
import 'package:quickreels/app/data/datasource/dto/create_reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/save_reel_comment_dto.dart';
import 'package:quickreels/app/data/datasource/dto/update_reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/data/datasource/reel_datasource.dart';
import 'package:quickreels/app/data/datasource/song_datasource.dart';
import 'package:quickreels/app/data/datasource/storage_datasource.dart';
import 'package:quickreels/app/data/datasource/user_datasource.dart';
import 'package:quickreels/app/data/mapper/comment_bo_mapper.dart';
import 'package:quickreels/app/data/mapper/reel_bo_mapper.dart';
import 'package:quickreels/app/domain/model/comment.dart';
import 'package:quickreels/app/domain/model/failure.dart';
import 'package:quickreels/app/domain/model/reel.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:quickreels/app/domain/repository/reel_repository.dart';
import 'package:uuid/uuid.dart';

class ReelRepositoryImpl implements ReelRepository {
  final ReelsDatasource reelsDatasource;
  final UserDatasource userDatasource;
  final StorageDatasource storageDatasource;
  final SongDatasource songDatasource;
  final Mapper<UserDTO, UserBO> userBoMapper;
  final Mapper<ReelBoMapperData, ReelBO> reelBoMapper;
  final Mapper<CommentBoMapperData, CommentBO> commentBoMapper;

  ReelRepositoryImpl(
      {required this.reelsDatasource,
      required this.userDatasource,
      required this.storageDatasource,
      required this.songDatasource,
      required this.userBoMapper,
      required this.reelBoMapper,
      required this.commentBoMapper});

  @override
  Future<bool> delete(String reelId) async {
    try {
      await reelsDatasource.delete(reelId);
      return true;
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }

  @override
  Future<bool> like({required String reelId, required String userUid}) async {
    try {
      final isLikedByUser =
          await reelsDatasource.like(reelId: reelId, userUuid: userUid);
      if (isLikedByUser) {
        userDatasource.increaseLikeCount(userUid);
      } else {
        userDatasource.decreaseLikeCount(userUid);
      }
      return isLikedByUser;
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }

  @override
  Future<bool> share({required String reelId, required String userUid}) async {
    try {
      return await reelsDatasource.share(reelId: reelId, userUuid: userUid);
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }

  @override
  Future<CommentBO> postComment(
      {required String reelId,
      required String text,
      required String authorUid}) async {
    try {
      final comment = await reelsDatasource.postComment(
          SaveReelCommentDTO(reelId: reelId, text: text, authorUid: authorUid));
      return await _mapToCommentBO(comment);
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }

  @override
  Future<bool> upload(
      {required String authorUid,
      required String description,
      required List<String> tags,
      required String songId,
      required Uint8List fileData,
      required String fileExt,
      String? placeInfo}) async {
    try {
      final postUrl = await storageDatasource.uploadFileToStorage(
          folderName: 'reels', id: const Uuid().v1() + fileExt, file: fileData);
      reelsDatasource.upload(CreateReelDTO(
          authorUid: authorUid,
          description: description,
          tags: tags,
          url: postUrl,
          placeInfo: placeInfo,
          songId: songId));
      return true;
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }

  @override
  Future<List<ReelBO>> findAllByUserUidOrderByDatePublished(
      String userUi) async {
    try {
      final reelsByUser =
          await reelsDatasource.findAllByUserUidOrderByDatePublished(userUi);
      final reels = await Future.wait(
          reelsByUser.map((post) async => _mapToReelBO(post)));
      return reels;
    } catch (ex) {
      debugPrint(
          "findAllByUserUidOrderByDatePublished - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<List<CommentBO>> findAllCommentsByReelId(String reelId) async {
    try {
      final commentsByReel =
          await reelsDatasource.findAllCommentsByReelId(reelId);
      final comments = await Future.wait(
          commentsByReel.map((comment) async => _mapToCommentBO(comment)));
      return comments;
    } catch (ex) {
      debugPrint("findAllCommentsByReelId - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<List<ReelBO>> findAllOrderByDatePublished() async {
    try {
      final reelListDTO = await reelsDatasource.findAllOrderByDatePublished();
      final reels = await Future.wait(
          reelListDTO.map((reelDTO) async => _mapToReelBO(reelDTO)));
      return reels;
    } catch (ex) {
      debugPrint("findAllOrderByDatePublished - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<List<ReelBO>> findAllByUserUidListOrderByDatePublished(
      List<String> userUidList) async {
    try {
      final reelsListDTO = await reelsDatasource
          .findAllByUserUidListOrderByDatePublished(userUidList);
      print("reelsListDTO -> ${reelsListDTO.length}");
      final reels = await Future.wait(
          reelsListDTO.map((reelDTO) async => _mapToReelBO(reelDTO)));
      return reels;
    } catch (ex) {
      debugPrint(
          "findAllByUserUidListOrderByDatePublished - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<List<ReelBO>> findAllFavoritesByUserUidOrderByDatePublished(
      String userUi) async {
    try {
      final reelListDTO = await reelsDatasource
          .findAllFavoritesByUserUidOrderByDatePublished(userUi);
      return await Future.wait(
          reelListDTO.map((reelDTO) async => _mapToReelBO(reelDTO)));
    } catch (ex) {
      debugPrint(
          "findAllFavoritesByUserUidOrderByDatePublished - ex -> ${ex.toString()}");
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<List<ReelBO>> findAllWithMostLikes(int limit) async {
    try {
      final reelListDTO = await reelsDatasource.findAllWithMostLikes(limit);
      return await Future.wait(
          reelListDTO.map((postDTO) async => _mapToReelBO(postDTO)));
    } catch (ex) {
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<ReelBO> findById(String uuid) async {
    try {
      final reelDTO = await reelsDatasource.findById(uuid);
      return await _mapToReelBO(reelDTO);
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }

  @override
  Future<bool> update(
      {required String reelUuid,
      required String description,
      required List<String> tags,
      required String? placeInfo}) async {
    try {
      await reelsDatasource.update(UpdateReelDTO(
          postUuid: reelUuid,
          description: description,
          tags: tags,
          placeInfo: placeInfo));
      return true;
    } catch (err) {
      throw Failure(message: err.toString());
    }
  }

  Future<ReelBO> _mapToReelBO(ReelDTO reel) async {
    final author = await userDatasource.findByUid(reel.authorUid);
    final song = await songDatasource.findById(reel.songId);
    return reelBoMapper(
        ReelBoMapperData(userDTO: author, reelDTO: reel, songDTO: song));
  }

  Future<CommentBO> _mapToCommentBO(CommentDTO comment) async {
    final author = await userDatasource.findByUid(comment.authorUid);
    return commentBoMapper(
        CommentBoMapperData(commentDTO: comment, userDTO: author));
  }
}
