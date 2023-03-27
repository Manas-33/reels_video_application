// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_video_application/controllers/provider/upload_video.dart';
import 'package:reels_video_application/views/widgets/custom_text_field.dart';
import 'package:video_player/video_player.dart';

import '../../constants.dart';

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
  TextEditingController _songNameController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: BackButton(color: secondaryColor),
        centerTitle: true,
      ),
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
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextField(
                            songNameController: _songNameController,
                            labelText: "Song Name",
                            icon: Icons.music_note)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextField(
                            songNameController: _captionController,
                            labelText: "Caption",
                            icon: Icons.format_quote_rounded)),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          final x = Provider.of<UploadVideoProvider>(context,
                              listen: false);
                          x.uploadVideo(_songNameController.text,
                              widget.videoPath, _captionController.text);
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
                                    "Publish!",
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
                    const SizedBox(height: 15),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
