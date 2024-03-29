import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_video_application/controllers/provider/google_sign_in.dart';

import '../../constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    var url = '${user!.photoURL}';

    return Consumer<GoogleSignInProvider>(
      builder: (context, value, child) => Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Stack(children: [
              Container(
                // width: 40,
                // height: 40,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    // color: Colors.white,
                    gradient:const  LinearGradient(
                      colors: [Colors.red, Colors.cyan],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    )),
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(45),
              //   child: Image(
              //     image: NetworkImage(url),
              //   ),
              // ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Hi! ${user.displayName}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  value.logOut();
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(7)),
                  child: Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: double.infinity,
                        width: 190,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        child: const Center(
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                                color: backgroundColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
