import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:reels_video_application/controllers/provider/google_sign_in.dart';

import '../models/video.dart';

class VideoProvider extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);

  List<Video> get videoList => _videoList.value;

  // var user = GetIt.instance<GoogleSignInProvider>().user;

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

  // videoLikes(String id) async {
  //   DocumentSnapshot doc =
  //       await FirebaseFirestore.instance.collection('videos').doc(id).get();

  //   var email = user.email;
  //   if ((doc.data()! as dynamic)['likes'].contains(email)) {
  //     await FirebaseFirestore.instance.collection('videos').doc(id).update({
  //       'likes': FieldValue.arrayRemove([email])
  //     });
  //   } else {
  //     await FirebaseFirestore.instance.collection('videos').doc(id).update({
  //       'likes': FieldValue.arrayUnion([email]),
  //     });
  //   }
  //   ;
  // }
}
