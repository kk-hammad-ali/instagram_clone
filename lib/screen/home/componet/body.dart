import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_clone/commons/colors.dart';
import 'package:instagram_clone/commons/dimension.dart';
import 'package:instagram_clone/screen/home/componet/post_card.dart';
import 'package:instagram_clone/services/post_firebase.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: PostService().getFirestoreSnapshotStream(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitRotatingCircle(
              color: primaryColor,
              size: dimensions.getScreenH(30),
            ),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) => PostCard(
            snapshot: snapshot.data!.docs[index].data(),
          ),
        );
      },
    );
  }
}
