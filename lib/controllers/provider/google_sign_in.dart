import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? person = userCredential.user;
      
      if (person != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(person.uid)
              .set({
            'name': person.displayName,
            'email': person.email,
            'profilePhoto': person.photoURL,
            'uid': person.uid,
          });
        }
      }
    } catch (e) {
      const SnackBar(
        content: Text("There was an error!"),
      );
      print(e.toString());
    }
    notifyListeners();
  }

  Future logOut() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
