import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_video_application/constants.dart';
import '../../controllers/provider/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              "Video Application",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: secondaryColor),
            ),
            const Text(
              "Hey there, Welcome Back",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            const Text(
              "Login to your account to continue",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
                  provider.googleLogin();
                },
                icon: SizedBox(
                  width: 45,
                  height: 45,
                  child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit: BoxFit.cover),
                ),
                label:
                    const Text("Sign In With Google", style: TextStyle(fontSize: 16))),
          ]),
        ),
      )
    );
  }
}
