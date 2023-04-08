import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/common_function.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';
import 'package:instagram_clone/screen/signin/sigin_screen.dart';
import 'package:instagram_clone/services/storage_firebase.dart';

class AuthServices {
  Future<void> createAccountWithEmailPassword({
    required String email,
    required String password,
    required context,
    required String username,
    required String bio,
    required Uint8List profileimage,
  }) async {
    try {
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final profileURL = await StorageService().storageImage(
        childImage: constStorageProfileFolder,
        image: profileimage,
        isPost: false,
        context: context,
      );
      await firestore.collection(constUser).doc(user.user!.uid).set({
        constUserId: user.user!.uid,
        constUserName: username,
        constUserEmail: email,
        constUserBio: bio,
        constUserProfileURL: profileURL,
        constUserFollower: [],
        constUserFollowing: [],
      });
      Navigator.pushReplacementNamed(context, SigninScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CommonFunction.showSnackBar(
          context,
          "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        CommonFunction.showSnackBar(
          context,
          "The account already exists for that email.",
        );
      } else if (e.code == 'operation-not-allowed') {
        CommonFunction.showSnackBar(
          context,
          "There is a problem with auth service config.",
        );
      } else {
        CommonFunction.showSnackBar(
          context,
          "$e",
        );
      }
    } catch (e) {
      CommonFunction.showSnackBar(
        context,
        "Failed to upload image",
      );
    }
  }

  Future<void> loginUserWithEmailPassword({
    required String email,
    required String password,
    required context,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        CommonFunction.showSnackBar(
          context,
          "The password provided is wrong",
        );
      } else if (e.code == 'user-not-found') {
        CommonFunction.showSnackBar(
          context,
          "No user found with this email",
        );
      } else if (e.code == 'user-disabled') {
        CommonFunction.showSnackBar(
          context,
          "User disabled",
        );
      } else if (e.code == 'invalid-email') {
        CommonFunction.showSnackBar(
          context,
          "Provided email address is invalid",
        );
      } else {
        CommonFunction.showSnackBar(
          context,
          "Login failed. Please try again",
        );
      }
    }
  }

  Future<void> signOut({required context}) async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      CommonFunction.showSnackBar(
        context,
        "Logout failed. Please try again",
      );
    }
  }
}
