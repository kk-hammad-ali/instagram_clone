import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/screen/signup/componet/body.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = "/signup";

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return const CupertinoScrollbar(
        child: SingleChildScrollView(
          child: SafeArea(child: BodySignupScreen()),
        ),
      );
    } else {
      return const SingleChildScrollView(
        child: SafeArea(child: BodySignupScreen()),
      );
    }
  }
}
