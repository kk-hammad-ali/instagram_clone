import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/signin/component/body.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodySigninScreen(),
    );
  }
}
