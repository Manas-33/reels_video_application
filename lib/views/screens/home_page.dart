import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_video_application/constants.dart';
import 'package:reels_video_application/controllers/provider/google_sign_in.dart';

import '../widgets/custom_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleSignInProvider>(
      builder: (context, value, child) => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              backgroundColor: backgroundColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: secondaryColor,
              currentIndex: pageIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    label: "Search"),
                BottomNavigationBarItem(icon: CustomIcon(), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.message,
                      size: 30,
                    ),
                    label: "Messages"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    label: "Profile"),
              ]),
          body: pages[pageIndex]),
    );
  }
}
