import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/model/user_model.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatelessWidget {
  static String routeName = "/mobilescreenlayout";
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = Provider.of<UserProvider>(context).getUser;
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS
        ? CupertinoPageScaffold(
            child: Center(
              child: Text(user!.userName),
            ),
          )
        : Scaffold(
            body: Center(
              child: Text(user!.userEmail),
            ),
          );
  }
}
