import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  static String routeName = "/responsivelayout";
  final Widget webScreen;
  final Widget mobileScreen;
  const ResponsiveLayout(
      {super.key, required this.webScreen, required this.mobileScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webScreen;
        } else {
          return mobileScreen;
        }
      },
    );
  }
}
