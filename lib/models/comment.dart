// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class Comment {
//   String username;
//   String comment;
//   final datePublished;
//   List likes;
//   String profilePhoto;
//   String uid;
//   String id;

//   Comment({
//     required this.username,
//     required this.comment,
//     required this.datePublished,
//     required this.likes,
//     required this.profilePhoto,
//     required this.uid,
//     required this.id,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'username': username,
//       'comment': comment,
//       'likes': likes,
//       'profilePhoto': profilePhoto,
//       'uid': uid,
//       'id': id,
//     };
//   }

//   // factory Comment.fromMap(Map<String, dynamic> map) {
//   //   return Comment(
//   //     username: map['username'] as String,
//   //     comment: map['comment'] as String,
//   //     profilePhoto: map['profilePhoto'] as String,
//   //     uid: map['uid'] as String,
//   //     id: map['id'] as String,
//   //     likes: List.from((map['likes'] as List),
//   //   ));
//   // }

//   Map<String, dynamic> toJson() => {
//         'username': username,
//         'comment': comment,
//         'datePublished': datePublished,
//         'likes': likes,
//         'profilePhoto': profilePhoto,
//         'uid': uid,
//         'id': id,
//       };

//   static Comment fromSnap(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;

//     return Comment(
//       username: snapshot['username'],
//       comment: snapshot['comment'],
//       datePublished: snapshot['datePublished'],
//       likes: snapshot['likes'],
//       profilePhoto: snapshot['profilePhoto'],
//       uid: snapshot['uid'],
//       id: snapshot['id'],
//     );
//   }

//   // factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source) as Map<String, dynamic>);
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String username;
  String comment;
  final datePublished;
  List likes;
  String profilePhoto;
  String uid;
  String id;

  Comment({
    required this.username,
    required this.comment,
    required this.datePublished,
    required this.likes,
    required this.profilePhoto,
    required this.uid,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'comment': comment,
        'datePublished': datePublished,
        'likes': likes,
        'profilePhoto': profilePhoto,
        'uid': uid,
        'id': id,
      };

  static Comment fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Comment(
      username: snapshot['username'],
      comment: snapshot['comment'],
      datePublished: snapshot['datePublished'],
      likes: snapshot['likes'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      id: snapshot['id'],
    );
  }
}
