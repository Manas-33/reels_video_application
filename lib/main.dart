import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_video_application/constants.dart';
import 'package:reels_video_application/controllers/provider/google_sign_in.dart';
import 'package:reels_video_application/controllers/provider/upload_video.dart';
import 'package:reels_video_application/views/screens/home_page.dart';
import 'package:reels_video_application/views/screens/login_page.dart';

// void setUpLocator() {
// // getIt.registerLazySingleton<GoogleSignInProvider>);
//   GetIt.I.registerSingleton<GoogleSignInProvider>(GoogleSignInProvider());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => UploadVideoProvider()),
        // ChangeNotifierProvider<VideosModel>(
        //     create: (_) => VideosModel()..fetchVideos())
      ],
      child: MaterialApp(
        navigatorKey: NavigationService().navigationKey,
        title: "Reels App",
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        home: Scaffold(
          body: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(
                    color: secondaryColor,
                  );
                } else if (snapshot.hasData) {
                  return const HomePage();
                } else if (snapshot.hasError) {
                  return (const Text("There was an Error!"));
                } else {
                  return const LoginPage();
                }
              }),
        ),
      ),
    );
  }
}
