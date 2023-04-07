import 'package:flutter/material.dart';

class MobileScreenLayout extends StatelessWidget {
  static String routeName = "/mobilescreenlayout";
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is mobile'),
      ),
    );
  }
}
