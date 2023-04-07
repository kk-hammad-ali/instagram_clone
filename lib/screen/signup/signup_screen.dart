import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/signup/componet/body.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = "/signup";
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: BodySignupScreen()),
    );
  }
}
