import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MobileScreenLayout extends StatelessWidget {
  static String routeName = "/mobilescreenlayout";
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS
        ? const CupertinoPageScaffold(
            child: Center(
              child: Text('This is mobile'),
            ),
          )
        : const Scaffold(
            body: Center(
              child: Text('This is mobile'),
            ),
          );
  }
}
