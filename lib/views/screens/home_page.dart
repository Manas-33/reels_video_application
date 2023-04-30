import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_video_application/constants.dart';
import 'package:reels_video_application/controllers/provider/google_sign_in.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleSignInProvider>(
      builder: (context, value, child) => Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            iconSize: 25,
            textSize: 16,
            textStyle: const TextStyle(fontWeight: FontWeight.w500),
            activeColor: secondaryColor,
            gap: 8,
            tabBackgroundColor: Colors.white24,
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add,
                text: 'Add',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
              
            ],
            onTabChange: (index) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
        ),
        body: pages[pageIndex],
      ),
    );
  }
}
