import 'package:flutter/material.dart';
import 'package:reels_video_application/views/screens/add_videos_page.dart';
import 'package:reels_video_application/views/screens/video_page.dart';

import 'views/screens/profile_page.dart';

const backgroundColor = Colors.black;
var secondaryColor = Colors.red[400];
const borderColor = Colors.grey;

List pages = [
  VideoPage(),
  const AddVideoPage(),
  const ProfilePage(),
];
