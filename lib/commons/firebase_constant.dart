import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseStorage firestorage = FirebaseStorage.instance;

get currentUID => firebaseAuth.currentUser!.uid;

// collection constant
const String constUser = "users";
const String constPosts = "posts";

// storage constat
const String constStorageProfileFolder = "profilePictures";
const String constStoragePostFolder = "postPictures";

// user constant
const String constUserId = "id";
const String constUserName = "name";
const String constUserEmail = "email";
const String constUserBio = "bio";
const String constUserFollower = "follower";
const String constUserFollowing = "following";
const String constUserProfileURL = "profileURL";

// post constant
const String constPostId = "id";
const String constPostDescrption = "desciption";
const String constPostImageURL = "postImageURL";
const String constPostUserName = "username";
const String constPostUserId = "uid";
const String constPostUserProfileURL = "userProfileURL";
const String constPostDatePublished = "datePublished";
const String constPostLikes = "likes";
