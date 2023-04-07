import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/responsive/responsive_layout_controller.dart';
import 'package:instagram_clone/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      initialRoute: ResponsiveLayout.routeName,
      routes: routes,
    );
  }
}
