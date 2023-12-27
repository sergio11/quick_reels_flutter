import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/comment_dto.dart';
import 'package:quickreels/app/data/datasource/dto/reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/save_reel_comment_dto.dart';
import 'package:quickreels/app/data/datasource/dto/create_reel_dto.dart';
import 'package:quickreels/app/data/datasource/dto/update_reel_dto.dart';
import 'package:quickreels/app/data/datasource/reel_datasource.dart';

class ReelsDatasourceImpl extends ReelsDatasource {
  final FirebaseFirestore firestore;
  final Mapper<SaveReelCommentDTO, Map<String, dynamic>> saveReelCommentMapper;
  final Mapper<CreateReelDTO, Map<String, dynamic>> saveReelMapper;
  final Mapper<UpdateReelDTO, Map<String, dynamic>> updateReelMapper;
  final Mapper<DocumentSnapshot, CommentDTO> commentMapper;
  final Mapper<DocumentSnapshot, ReelDTO> reelMapper;

  ReelsDatasourceImpl(
      {required this.firestore,
      required this.saveReelCommentMapper,
      required this.saveReelMapper,
      required this.updateReelMapper,
      required this.commentMapper,
      required this.reelMapper});

  CollectionReference<Map<String, dynamic>> get _reelsCollection =>
      firestore.collection('reels');

  @override
  Future<void> delete(String reelId) async {
    final DocumentReference<Map<String, dynamic>> reelRef =
        _reelsCollection.doc(reelId);
    final DocumentSnapshot<Map<String, dynamic>> reelSnapshot =
        await reelRef.get();
    if (reelSnapshot.exists) {
      await reelRef.delete();
    }
  }

  @override
  Future<bool> like({required String reelId, required String userUuid}) async {
    final DocumentReference<Map<String, dynamic>> reelRef =
        _reelsCollection.doc(reelId);
    final DocumentSnapshot<Map<String, dynamic>> snap = await reelRef.get();
    Map<String, dynamic> reelData = snap.data() ?? {};
    List<String> likes = List<String>.from(reelData['likes'] ?? []);
    final bool isLikedByUser = likes.contains(userUuid);
    await reelRef.update({
      'likes': isLikedByUser
          ? FieldValue.arrayRemove([userUuid])
          : FieldValue.arrayUnion([userUuid]),
      'likesCount': FieldValue.increment(isLikedByUser ? -1 : 1),
    });
    return !isLikedByUser;
  }

  @override
  Future<bool> share({required String reelId, required String userUuid}) async {
    final DocumentReference<Map<String, dynamic>> reelRef =
        _reelsCollection.doc(reelId);
    final DocumentSnapshot<Map<String, dynamic>> snap = await reelRef.get();
    Map<String, dynamic> reelData = snap.data() ?? {};
    List<String> shares = List<String>.from(reelData['shares'] ?? []);
    final bool isSharedByUser = shares.contains(userUuid);
    if (!isSharedByUser) {
      await reelRef.update({
        'shares': FieldValue.arrayUnion([userUuid]),
        'sharesCount': FieldValue.increment(1),
      });
    }
    return !isSharedByUser;
  }

  @override
  Future<void> upload(CreateReelDTO reel) async {
    final reelData = saveReelMapper(reel);
    await _reelsCollection.doc(reelData['reelId']).set(reelData);
  }

  @override
  Future<void> update(UpdateReelDTO reel) async {
    final reelRef = _reelsCollection.doc(reel.postUuid);
    final updateData = updateReelMapper(reel);
    await reelRef.update(updateData);
  }

  @override
  Future<CommentDTO> postComment(SaveReelCommentDTO commentDTO) async {
    final commentData = saveReelCommentMapper(commentDTO);
    final postRef = _reelsCollection.doc(commentDTO.reelId);
    await postRef
        .collection('comments')
        .doc(commentData['commentId'])
        .set(commentData);
    await postRef.update({'commentsCount': FieldValue.increment(1)});
    final commentSnap = await postRef
        .collection('comments')
        .doc(commentData['commentId'])
        .get();
    return commentMapper(commentSnap);
  }

  @override
  Future<List<CommentDTO>> findAllCommentsByReelId(String reelId) async {
    final comments = await _reelsCollection
        .doc(reelId)
        .collection('comments')
        .orderBy('datePublished', descending: true)
        .get();
    return comments.docs.map((doc) => commentMapper(doc)).toList();
  }

  @override
  Future<ReelDTO> findById(String id) async {
    final docSnap = await _reelsCollection.doc(id).get();
    return reelMapper(docSnap);
  }

  @override
  Future<List<ReelDTO>> findAllByUserUidOrderByDatePublished(
      String userUuid) async {
    final postByUser = await _reelsCollection
        .where('authorUid', isEqualTo: userUuid)
        .orderBy('datePublished', descending: true)
        .get();
    return postByUser.docs.map((doc) => reelMapper(doc)).toList();
  }

  @override
  Future<List<ReelDTO>> findAllOrderByDatePublished() async {
    final posts =
        await _reelsCollection.orderBy('datePublished', descending: true).get();
    return posts.docs.map((doc) => reelMapper(doc)).toList();
  }

  @override
  Future<List<ReelDTO>> findAllByUserUidListOrderByDatePublished(
      List<String> userUuidList) async {
    final postByUser = await _reelsCollection
        .where('authorUid', whereIn: userUuidList)
        .orderBy('datePublished', descending: true)
        .get();
    print(" postByUser.docs -> ${postByUser.docs.length}");
    return postByUser.docs.map((doc) => reelMapper(doc)).toList();
  }

  @override
  Future<List<ReelDTO>> findAllFavoritesByUserUidOrderByDatePublished(
      String userUuid) async {
    final favoritePostsByUser = await _reelsCollection
        .where('likes', arrayContains: userUuid)
        .orderBy('datePublished', descending: true)
        .get();
    return favoritePostsByUser.docs.map((doc) => reelMapper(doc)).toList();
  }

  @override
  Future<List<ReelDTO>> findAllWithMostLikes(int limit) async {
    final reelsWithMostLikes = await _reelsCollection
        .orderBy('likesCount', descending: true)
        .limit(limit)
        .get();
    return reelsWithMostLikes.docs.map((doc) => reelMapper(doc)).toList();
  }
}
