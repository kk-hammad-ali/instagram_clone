import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/responsive/mobile_layout.dart';
import 'package:instagram_clone/utils/responsive/responsive_layout_controller.dart';
import 'package:instagram_clone/utils/responsive/web_layout.dart';

final Map<String, WidgetBuilder> routes = {
  ResponsiveLayout.routeName: (context) => const ResponsiveLayout(webScreen: WebScreenLayout(), mobileScreen: MobileScreenLayout(),),
  MobileScreenLayout.routeName: (context) => const MobileScreenLayout(),
  WebScreenLayout.routeName: (context) => const WebScreenLayout(),

};
