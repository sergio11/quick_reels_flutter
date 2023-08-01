import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quickreels/constants.dart';
import 'package:quickreels/model/user.dart';

class DiscoverController extends GetxController {
  final Rx<List<UserData>> _searchedUsers = Rx<List<UserData>>([]);

  List<UserData> get searchedUsers => _searchedUsers.value;

  searchUser(String typedUser) async {
    _searchedUsers.bindStream(firestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot query) {
      List<UserData> retVal = [];
      for (var elem in query.docs) {
        retVal.add(UserData.fromSnap(elem));
      }
      return retVal;
    }));
  }
}