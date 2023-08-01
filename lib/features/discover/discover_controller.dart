import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quickreels/constants.dart';
import 'package:quickreels/domain/model/user.dart';

class DiscoverController extends GetxController {
  final Rx<List<UserBO>> _searchedUsers = Rx<List<UserBO>>([]);

  List<UserBO> get searchedUsers => _searchedUsers.value;

  searchUser(String typedUser) async {
    _searchedUsers.bindStream(firestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot query) {
      List<UserBO> retVal = [];
      for (var elem in query.docs) {
        retVal.add(UserBO.fromSnap(elem));
      }
      return retVal;
    }));
  }
}