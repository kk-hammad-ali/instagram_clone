import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/post/componet/body.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyAddPostScreen(),
    );
  }
}
