import 'dart:typed_data';
import 'package:quickreels/app/domain/model/comment.dart';
import 'package:quickreels/app/domain/model/reel.dart';

/// A contract defining the operations related to reels.
///
/// This abstract class provides a set of methods to interact with reel-related
/// data, including uploading, updating, liking, commenting,
/// and fetching reels based on various criteria.
abstract class ReelRepository {
  /// Uploads a new reel.
  ///
  /// Returns a boolean indicating whether the upload was successful.
  Future<bool> upload({
    required String authorUid,
    required String description,
    required List<String> tags,
    required Uint8List file,
    required String songId,
    String? placeInfo,
  });

  /// Updates an existing reel.
  ///
  /// Returns a boolean indicating whether the update was successful.
  Future<bool> update({
    required String reelUuid,
    required String description,
    required List<String> tags,
    required String? placeInfo,
  });

  /// Likes a reel.
  ///
  /// Returns a boolean indicating whether the like operation was successful.
  Future<bool> like({
    required String reelId,
    required String userUid,
  });

  /// Share a reel
  ///
  /// Returns a boolean indicating whether the share operation was successful.
  Future<bool> share({
    required String reelId,
    required String userUid,
  });

  /// Posts a comment on a reel.
  ///
  /// Returns a [CommentBO] object representing the posted comment.
  Future<CommentBO> postComment({
    required String reelId,
    required String text,
    required String authorUid,
  });

  /// Deletes a reel.
  ///
  /// Returns a boolean indicating whether the delete operation was successful.
  Future<bool> delete(String reelId);

  /// Retrieves all reels created by a specific user, ordered by date published.
  ///
  /// Returns a list of [ReelBO] objects representing reels by the specified user.
  Future<List<ReelBO>> findAllByUserUidOrderByDatePublished(String userUi);

  /// Retrieves all comments associated with a specific reel.
  ///
  /// Returns a list of [CommentBO] objects representing comments on the reel.
  Future<List<CommentBO>> findAllCommentsByReelId(String reelId);

  /// Retrieves all reels ordered by date published.
  ///
  /// Returns a list of [ReelBO] objects representing all reels.
  Future<List<ReelBO>> findAllOrderByDatePublished();

  /// Retrieves all reels favorited by a specific user, ordered by date published.
  ///
  /// Returns a list of [ReelBO] objects representing reels favorited by the user.
  Future<List<ReelBO>> findAllFavoritesByUserUidOrderByDatePublished(String userUi);

  /// Retrieves all reels created by a list of user IDs, ordered by date published.
  ///
  /// Returns a list of [ReelBO] objects representing reels by the specified users.
  Future<List<ReelBO>> findAllByUserUidListOrderByDatePublished(List<String> userUidList);

  /// Retrieves a specific number of reels with the most likes, limited by [limit].
  ///
  /// Returns a list of [ReelBO] objects representing reels with the most likes.
  Future<List<ReelBO>> findAllWithMostLikes(int limit);

  /// Retrieves a reel by its unique identifier.
  ///
  /// Returns a [ReelBO] object representing the retrieved reel.
  Future<ReelBO> findById(String uuid);
}