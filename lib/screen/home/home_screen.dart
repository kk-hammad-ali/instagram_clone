import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/screen/signin/component/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({
    super.key,
  });

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
          child: SafeArea(child: BodySigninScreen()),
        ),
      );
    } else {
      return const SingleChildScrollView(
        child: SafeArea(child: BodySigninScreen()),
      );
    }
  }
}
