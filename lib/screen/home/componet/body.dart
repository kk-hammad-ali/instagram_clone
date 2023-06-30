import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_firebase.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          await AuthServices().signOut(context: context);
        },
        child: const Text('Home Screen'),
      ),
    );
  }
}
