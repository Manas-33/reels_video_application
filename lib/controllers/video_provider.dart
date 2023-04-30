import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/video.dart';

class VideoProvider extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);

  List<Video> get videoList => _videoList.value;

  User? user = FirebaseAuth.instance.currentUser;
  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(FirebaseFirestore.instance
        .collection('videos')
        .snapshots()
        .map((QuerySnapshot query) {
      List<Video> values = [];
      for (var element in query.docs) {
        values.add(
          Video.fromSnap(element),
        );
      }
      return values;
    }));
  }

  videoLikes(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('videos').doc(id).get();

    var email = user!.email;
    if ((doc.data()! as dynamic)['likes'].contains(email)) {
      await FirebaseFirestore.instance.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([email])
      });
    } else {
      await FirebaseFirestore.instance.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([email]),
      });
    }
  }
  
}
