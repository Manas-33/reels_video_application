// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:reels_video_application/constants.dart';
import 'package:reels_video_application/controllers/comment_controller.dart';

class CommentPage extends StatelessWidget {
  final String id;
  CommentPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final TextEditingController _commentController = TextEditingController();
  CommentController controller = Get.put(CommentController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    controller.updatePostId(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: BackButton(color: secondaryColor),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(child: Obx(() {
                return ListView.builder(
                    itemCount: controller.comments.length,
                    itemBuilder: ((context, index) {
                      var comment = controller.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: backgroundColor,
                          backgroundImage: NetworkImage(comment.profilePhoto),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              comment.username,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              timeAgo.format(comment.datePublished.toDate()),
                              style:
                                  const TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        subtitle: Row(children: [
                          Text(
                            comment.comment,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                      );
                    }));
              })),
              const Divider(),
              ListTile(
                title: TextFormField(
                    controller: _commentController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: "Comment",
                      labelStyle:  TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    )),
                trailing: TextButton(
                  onPressed: () =>
                      controller.postComment(_commentController.text),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
