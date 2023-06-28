import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/home/componet/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyHomeScreen(),
    );
  }
}
