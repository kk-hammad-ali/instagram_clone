import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/commons/common_function.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';
import 'package:instagram_clone/model/post_model.dart';
import 'package:instagram_clone/services/storage_firebase.dart';
import 'package:uuid/uuid.dart';

class PostService {
  Future<void> addPostToFirebase({
    required userID,
    required userPhotoURL,
    required userName,
    required postDescrption,
    required Uint8List postImage,
    required context,
  }) async {
    try {
      String postImageURL = await StorageService().storageImage(
        imageFolderName: constStoragePostFolder,
        image: postImage,
        isPost: true,
        context: context,
      );

      String postID = const Uuid().v1();

      PostModel postModel = PostModel(
        postId: postID,
        postDescrption: postDescrption,
        postImageURL: postImageURL,
        userName: userName,
        userId: userID,
        userPhotoURL: userPhotoURL,
        datePublished: DateTime.now(),
      );

      await firestore.collection(constPosts).doc(postID).set(
            postModel.toJson(),
          );
    } on FirebaseException catch (e) {
      CommonFunction.showSnackBar(
        context,
        '$e',
      );
    }
  }
}
