import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_video_application/controllers/provider/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleSignInProvider>(
      builder: (context, value, child) => Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Image.network("${value.user.photoUrl}"),
            // Text("${value.user.displayName}"),
            // Text("${value.user.email}"),
            ElevatedButton(
                onPressed: () {
                  value.logOut();
                },
                child: Text("Log-Out")),
          ]),
        ),
      ),
    );
  }
}
