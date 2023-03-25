import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reels_video_application/constants.dart';

import 'confirmation_page.dart';

class AddVideoPage extends StatelessWidget {
  const AddVideoPage({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ConfirmPage(
                videoFile: File(video.path),
                videoPath: video.path,
              )));
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.gallery, context),
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      Container(
                        width: 20,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
                Container(height: 10),
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.camera, context),
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt),
                      Container(
                        width: 20,
                      ),
                      Text(
                        "Record a Video",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
                Container(height: 10),
                SimpleDialogOption(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Row(
                    children: [
                      Icon(Icons.cancel),
                      Container(
                        width: 20,
                      ),
                      Text(
                        "Cancel",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () => showOptionsDialog(context),
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(7)),
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
                  color: Colors.cyan, borderRadius: BorderRadius.circular(7)),
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
                    "Add Video",
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
      )),
    );
  }
}
