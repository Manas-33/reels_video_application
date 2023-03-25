// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reels_video_application/views/widgets/custom_text_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmPage extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmPage({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  late VideoPlayerController controller;
  TextEditingController songNameController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(7),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextField(
                            songNameController: songNameController,
                            labelText: "Song Name",
                            icon: Icons.music_note)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextField(
                            songNameController: captionController,
                            labelText: "Caption",
                            icon: Icons.format_quote_rounded)),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Publish!",
                          style: TextStyle(fontSize: 17),
                        ))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
