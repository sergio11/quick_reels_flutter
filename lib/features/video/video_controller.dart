import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quickreels/constants.dart';
import 'package:quickreels/domain/model/video.dart';

class VideoController extends GetxController {
  final Rx<List<VideoBO>> _videoList = Rx<List<VideoBO>>([]);

  List<VideoBO> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
        firestore.collection('videos').snapshots().map((QuerySnapshot query) {
          List<VideoBO> retVal = [];
          for (var element in query.docs) {
            retVal.add(
              VideoBO.fromSnap(element),
            );
          }
          return retVal;
        }));
  }

  likeVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }
  }
}