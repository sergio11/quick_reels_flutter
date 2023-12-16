import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/save_user_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/data/datasource/user_datasource.dart';

class UserDatasourceImpl extends UserDatasource {
  final FirebaseFirestore firestore;
  final Mapper<DocumentSnapshot, UserDTO> userDtoMapper;
  final Mapper<SaveUserDTO, Map<String, dynamic>> saveUserDtoMapper;

  UserDatasourceImpl({
    required this.firestore,
    required this.userDtoMapper,
    required this.saveUserDtoMapper,
  });

  @override
  Future<UserDTO> findByUid(String uid) async {
    final docSnap = await firestore.collection('users').doc(uid).get();
    return userDtoMapper(docSnap);
  }

  @override
  Future<void> followUser(String uid, String followId) async {
    final userRef = firestore.collection('users');
    final uidDoc = userRef.doc(uid);
    final followIdDoc = userRef.doc(followId);
    final uidSnap = await uidDoc.get();
    final uidData = uidSnap.data()!;
    final uidFollowing = List<String>.from(uidData['following'] ?? []);
    if (uidFollowing.contains(followId)) {
      await followIdDoc.update({
        'followers': FieldValue.arrayRemove([uid])
      });

      await uidDoc.update({
        'following': FieldValue.arrayRemove([followId])
      });
    } else {
      await followIdDoc.update({
        'followers': FieldValue.arrayUnion([uid])
      });

      await uidDoc.update({
        'following': FieldValue.arrayUnion([followId])
      });
    }
  }

  @override
  Future<void> save(SaveUserDTO user) async {
    await firestore
        .collection("users")
        .doc(user.uid)
        .set(saveUserDtoMapper(user));
  }

  @override
  Future<List<UserDTO>> findByName(String username) async {
    final querySnapshot = await firestore
        .collection('users')
        .where('username', isGreaterThanOrEqualTo: username)
        .get();

    return querySnapshot.docs.map((doc) => userDtoMapper(doc)).toList();
  }

  @override
  Future<List<UserDTO>> findAllFollowedBy(String uid) async {
    return _findAllByArrayContains('users', 'followers', uid);
  }

  @override
  Future<List<UserDTO>> findAllFollowersBy(String uid) async {
    return _findAllByArrayContains('users', 'following', uid);
  }

  Future<List<UserDTO>> _findAllByArrayContains(
      String collection,
      String arrayField,
      String uid,
      ) async {
    final snapshot = await firestore
        .collection(collection)
        .where(arrayField, arrayContains: uid)
        .get();

    return snapshot.docs.map((doc) => userDtoMapper(doc)).toList();
  }
}
