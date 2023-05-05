import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';

class UserModel {
  final String userId;
  final String userEmail;
  final String userName;
  final String userBio;
  final String userPhotoURL;
  final List userFollowers;
  final List userFollowing;

  UserModel({
    required this.userId,
    required this.userEmail,
    required this.userName,
    required this.userBio,
    required this.userPhotoURL,
    required this.userFollowers,
    required this.userFollowing,
  });

  Map<String, dynamic> toJson() => {
        constUserId: userId,
        constUserName: userName,
        constUserEmail: userEmail,
        constUserBio: userBio,
        constUserProfileURL: userPhotoURL,
        constUserFollower: userFollowers,
        constUserFollowing: userFollowing,
      };

  static UserModel fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      userId: data[constUserId],
      userEmail: data[constUserEmail],
      userName: data[constUserName],
      userBio: data[constUserBio],
      userPhotoURL: data[constUserProfileURL],
      userFollowers: List.from(data[constUserFollower]),
      userFollowing: List.from(data[constUserFollowing]),
    );
  }
}
