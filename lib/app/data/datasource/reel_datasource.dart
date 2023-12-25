import 'package:quickreels/app/data/datasource/dto/comment_dto.dart';
import 'package:quickreels/app/data/datasource/dto/reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/save_reel_comment_dto.dart';
import 'package:quickreels/app/data/datasource/dto/create_reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/update_reel_dto.dart';

/// A contract defining methods to interact with reels-related data sources.
abstract class ReelsDatasource {
  /// Fetches a reel by its ID.
  Future<ReelDTO> findById(String id);

  /// Deletes a reel by its ID.
  Future<void> delete(String reelId);

  /// Posts a comment for a reel.
  Future<CommentDTO> postComment(SaveReelCommentDTO commentDTO);

  /// Likes a reel.
  Future<bool> like({required String reelId, required String userUuid});

  /// share a reel.
  Future<bool> share({required String reelId, required String userUuid});

  /// Uploads a new reel.
  Future<void> upload(CreateReelDTO reel);

  /// Updates an existing reel.
  Future<void> update(UpdateReelDTO reel);

  /// Fetches all comments for a specific reel by its ID.
  Future<List<CommentDTO>> findAllCommentsByReelId(String reelId);

  /// Fetches all reels by a user ordered by date published.
  Future<List<ReelDTO>> findAllByUserUidOrderByDatePublished(String userUuid);

  /// Fetches all reels ordered by date published.
  Future<List<ReelDTO>> findAllOrderByDatePublished();

  /// Fetches all favorite reels by a user ordered by date published.
  Future<List<ReelDTO>> findAllFavoritesByUserUidOrderByDatePublished(
      String userUuid);

  /// Fetches all posts by multiple users ordered by date published.
  Future<List<ReelDTO>> findAllByUserUidListOrderByDatePublished(
      List<String> userUuidList);


  Future<List<ReelDTO>> findAllWithMostLikes(int limit);
}
