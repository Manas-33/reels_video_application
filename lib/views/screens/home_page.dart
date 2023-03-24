import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_video_application/controllers/provider/google_sign_in.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to the homepage"),
          ElevatedButton(onPressed: (){
            final provider=Provider.of<GoogleSignInProvider>(context,listen:false);
            provider.logOut();
          }, child: Text("Logout"))
        ],
      ),
    );
  }
}