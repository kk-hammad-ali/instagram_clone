import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/bottom/bottom_bar_screen.dart';

class MobileScreenLayout extends StatelessWidget {
  static String routeName = "/mobilescreenlayout";
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS ? const BottomBarNavigation() : const BottomBarNavigation();
  }
}
