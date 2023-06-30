import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';

class PostModel {
  final String postId;
  final String postDescrption;
  final String postImageURL;
  final String userName;
  final String userId;
  final String userPhotoURL;
  final DateTime datePublished;
  final int? likes;

  PostModel({
    required this.postId,
    required this.postDescrption,
    required this.postImageURL,
    required this.userName,
    required this.userId,
    required this.userPhotoURL,
    required this.datePublished,
    this.likes,
  });

  Map<String, dynamic> toJson() => {
        constPostId: postId,
        constPostDescrption: postDescrption,
        constPostImageURL: postImageURL,
        constPostUserName: userName,
        constPostUserId: userId,
        constPostUserProfileURL: userPhotoURL,
        constPostDatePublished: datePublished,
        constPostLikes: likes,
      };

  static PostModel fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return PostModel(
      postId: data[constPostId],
      postDescrption: data[constPostDescrption],
      postImageURL: data[constPostImageURL],
      userName: data[constPostUserName],
      userId: data[constPostUserId],
      userPhotoURL: data[constPostUserProfileURL],
      datePublished: data[constPostDatePublished],
    );
  }
}
