import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/save_user_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/data/datasource/user_datasource.dart';

class UserDatasourceImpl extends UserDatasource {
  final FirebaseFirestore firestore;
  final Mapper<DocumentSnapshot, UserDTO> userDtoMapper;
  final Mapper<SaveUserDTO, Map<String, dynamic>> saveUserDtoMapper;

  UserDatasourceImpl(
      {required this.firestore,
      required this.userDtoMapper,
      required this.saveUserDtoMapper});

  @override
  Future<UserDTO> findByUid(String uid) async {
    final docSnap = await firestore.collection('users').doc(uid).get();
    return userDtoMapper(docSnap);
  }

  @override
  Future<void> followUser(String uid, String followId) async {
    DocumentSnapshot snap = await firestore.collection('users').doc(uid).get();
    List following = (snap.data()! as dynamic)['following'];

    if (following.contains(followId)) {
      await firestore.collection('users').doc(followId).update({
        'followers': FieldValue.arrayRemove([uid])
      });

      await firestore.collection('users').doc(uid).update({
        'following': FieldValue.arrayRemove([followId])
      });
    } else {
      await firestore.collection('users').doc(followId).update({
        'followers': FieldValue.arrayUnion([uid])
      });

      await firestore.collection('users').doc(uid).update({
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
    final docSnap = await firestore
        .collection('users')
        .where(
          'username',
          isGreaterThanOrEqualTo: username,
        )
        .get();
    return docSnap.docs
        .map((doc) => userDtoMapper(doc))
        .toList();
  }

  @override
  Future<List<UserDTO>> findAllThatUserIsFollowingBy(String uid) async {
    final userSnap = await firestore.collection('users').doc(uid).get();
    final userDTO = userDtoMapper(userSnap);
    final followingSnap = await firestore
        .collection('users')
        .where('followers', arrayContains: uid)
        .get();
    final followingDTOList = followingSnap.docs
        .map((doc) => userDtoMapper(doc))
        .toList();
    return followingDTOList..add(userDTO);
  }
}