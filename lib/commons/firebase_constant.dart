import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseStorage firestorage = FirebaseStorage.instance;

// collection constant
const String constUser = "users";

// storage constat
const String constStorageProfileFolder = "profilePictures";

// user constant
const String constUserId = "id";
const String constUserName = "name";
const String constUserEmail = "email";
const String constUserBio = "bio";
const String constUserFollower = "follower";
const String constUserFollowing = "following";
const String constUserProfileURL = "profileURL";
