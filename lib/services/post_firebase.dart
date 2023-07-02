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
        likes: [],
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

  Stream<QuerySnapshot<Map<String, dynamic>>> getFirestoreSnapshotStream() {
    CollectionReference<Map<String, dynamic>> collectionReference =
        firestore.collection(constPosts).withConverter<Map<String, dynamic>>(
              fromFirestore: (snapshot, _) => snapshot.data()!,
              toFirestore: (data, _) => data,
            );
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshotStream =
        collectionReference.snapshots();
    return snapshotStream;
  }

  Future<void> updateLikes(String postID, String userID, context) async {
    try {
      final postDoc = await FirebaseFirestore.instance
          .collection(constPosts)
          .doc(postID)
          .get();
      final likes = List<String>.from(postDoc.data()![constPostLikes] ?? []);

      if (likes.contains(userID)) {
        likes.remove(userID);
        await FirebaseFirestore.instance
            .collection(constPosts)
            .doc(postID)
            .update({constPostLikes: likes});
      } else {
        likes.add(userID);
        await FirebaseFirestore.instance
            .collection(constPosts)
            .doc(postID)
            .update({constPostLikes: likes});
      }
    } catch (error) {
      CommonFunction.showSnackBar(
        context,
        '$error',
      );
    }
  }
}
