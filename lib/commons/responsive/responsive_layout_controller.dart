import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/constants.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  static String routeName = "/responsivelayout";
  final Widget webScreen;
  final Widget mobileScreen;
  const ResponsiveLayout(
      {super.key, required this.webScreen, required this.mobileScreen});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    userData();
    super.initState();
  }

  void userData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUserData();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webScreen;
        } else {
          return widget.mobileScreen;
        }
      },
    );
  }
}
