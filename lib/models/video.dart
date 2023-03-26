import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Video {
  String username;
  String uid;
  String id;
  List likes;
  int commentCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnailUrl;
  String profilePhoto;
  String email;
  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.profilePhoto,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "id": id,
        "likes": likes,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "songName": songName,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnailUrl": thumbnailUrl,
        "profilePhoto": profilePhoto,
        "email": email,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Video(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      commentCount: snapshot['commentCount'],
      shareCount: snapshot['shareCount'],
      songName: snapshot['songName'],
      caption: snapshot['caption'],
      videoUrl: snapshot['videoUrl'],
     profilePhoto: snapshot['profilePhoto'],
      thumbnailUrl: snapshot['thumbnailUrl'], 
      email: snapshot['email'],
    );
  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'uid': uid,
      'id': id,
      'likes': likes,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'songName': songName,
      'caption': caption,
      'videoUrl': videoUrl,
      'thumbnailUrl': thumbnailUrl,
      'profilePhoto': profilePhoto,
      "email": email,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(username: map['username'] as String,
      uid: map['uid'] as String,
      id: map['id'] as String,
      commentCount: map['commentCount'] as int,
      shareCount: map['shareCount'] as int,
      songName: map['songName'] as String,
      caption: map['caption'] as String,
      videoUrl: map['videoUrl'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      profilePhoto: map['profilePhoto'] as String,
      email: map['email'] as String,
      likes: List.from((map['likes'] as List),
    ));
  }

  // String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source) as Map<String, dynamic>);
}
