import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String name;
  String profilePhoto;
  String email;
  String uid;

  UserData(
      {required this.name,
        required this.email,
        required this.uid,
        required this.profilePhoto});

  Map<String, dynamic> toJson() => {
    "name": name,
    "profilePhoto": profilePhoto,
    "email": email,
    "uid": uid,
  };

  static UserData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserData(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}