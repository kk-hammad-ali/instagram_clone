import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/colors.dart';
import 'package:instagram_clone/commons/dimension.dart';
import 'package:instagram_clone/model/user_model.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/screen/home/componet/comment_card.dart';
import 'package:instagram_clone/services/post_firebase.dart';
import 'package:provider/provider.dart';

class CommentSection extends StatelessWidget {
  final String postID;

  const CommentSection({super.key, required this.postID});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final TextEditingController commentController = TextEditingController();
    final UserModel? user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: const CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: EdgeInsets.only(
            left: dimensions.getScreenW(16),
            right: dimensions.getScreenW(15),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: dimensions.getScreenW(20),
                backgroundImage: NetworkImage(
                  user!.userPhotoURL,
                ),
              ),
              SizedBox(
                width: dimensions.getScreenW(10),
              ),
              Expanded(
                child: TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                      hintText: 'Comment as ${user.userName}',
                      border: InputBorder.none),
                ),
              ),
              IconButton(
                onPressed: () {
                  PostService().addCommentToPost(
                    postID,
                    user.userName,
                    user.userId,
                    commentController.text,
                    user.userPhotoURL,
                    context,
                  );
                  commentController.text = '';
                },
                icon: const Icon(
                  Icons.send,
                  color: blueColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
