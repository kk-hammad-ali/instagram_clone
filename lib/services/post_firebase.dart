import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/commons/common_function.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';
import 'package:instagram_clone/model/comment_model.dart';
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
        likes: [],
      );

      await firestore.collection(constPosts).doc(postID).set(
            postModel.toJson(),
          );
    } on FirebaseException {
      CommonFunction.showSnackBar(
        context,
        'Unable to add post try later',
      );
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFirestoreSnapshotStream(
      context) {
    try {
      CollectionReference<Map<String, dynamic>> collectionReference =
          firestore.collection(constPosts).withConverter<Map<String, dynamic>>(
                fromFirestore: (snapshot, _) => snapshot.data()!,
                toFirestore: (data, _) => data,
              );
      Stream<QuerySnapshot<Map<String, dynamic>>> snapshotStream =
          collectionReference.snapshots();
      return snapshotStream;
    } catch (error) {
      CommonFunction.showSnackBar(
        context,
        'Unable to load data try later',
      );
      return const Stream.empty();
    }
  }

  Future<void> updateLikes(String postID, String userID, context) async {
    try {
      final postDoc = await firestore.collection(constPosts).doc(postID).get();
      final likes = List<String>.from(postDoc.data()![constPostLikes] ?? []);

      if (likes.contains(userID)) {
        likes.remove(userID);
        await firestore
            .collection(constPosts)
            .doc(postID)
            .update({constPostLikes: likes});
      } else {
        likes.add(userID);
        await firestore
            .collection(constPosts)
            .doc(postID)
            .update({constPostLikes: likes});
      }
    } catch (error) {
      CommonFunction.showSnackBar(
        context,
        'Unable to like right now please try later',
      );
    }
  }

  Future<void> addCommentToPost(String postID, String username, String userID,
      String comment, String userURL, context) async {
    try {
      if (comment.isNotEmpty) {
        final commentId = const Uuid().v1();

        CommentModel commentModel = CommentModel(
          id: commentId,
          postID: postID,
          userID: userID,
          username: username,
          comment: comment,
          userProfileURL: userURL,
        );

        await firestore
            .collection(constPosts)
            .doc(postID)
            .collection(constComments)
            .doc(commentId)
            .set(
              commentModel.toJson(),
            );
        CommonFunction.showSnackBar(
          context,
          'Comment posted',
        );
      } else {
        CommonFunction.showSnackBar(
          context,
          'Please write something to comment',
        );
      }
    } catch (error) {
      CommonFunction.showSnackBar(
        context,
        'Unable to comment right now please try later',
      );
    }
  }
}
