import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/login/component/body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyLoginScreen(),
    );
  }
}
