import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';

class CommentModel {
  String id;
  String userID;
  String postID;
  String comment;
  String userProfileURL;
  String username;

  CommentModel({
    required this.id,
    required this.userID,
    required this.postID,
    required this.comment,
    required this.userProfileURL,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        constCommentId: id,
        constCommentUserId: userID,
        constCommentPostId: postID,
        constCommentText: comment,
        constCommentUserProfileURL: userProfileURL,
        constCommentUsername: username,
      };

  static CommentModel fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CommentModel(
      id: data[constCommentId],
      userID: data[constCommentUserId],
      postID: data[constCommentPostId],
      comment: data[constCommentText],
      userProfileURL: data[constCommentUserProfileURL],
      username: data[constCommentUsername],
    );
  }
}
