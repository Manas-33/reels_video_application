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
}
