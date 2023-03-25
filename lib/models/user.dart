import 'dart:convert';
import 'dart:html';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {

  String name;
  String profilePhoto;
  String email;
  String uid;
  
  User({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toJson()=> {
    
      'name': name,
      'profilePhoto': profilePhoto,
      'email': email,
      'uid': uid,
    
  };

  // static User fromSnap(DocumentSnapshot snap){
  //   var snapshot = snap.data()
  // }
}
