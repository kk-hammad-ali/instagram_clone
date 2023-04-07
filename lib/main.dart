import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/responsive/responsive_layout_controller.dart';
import 'package:instagram_clone/utils/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyC92ApbCY_YAHuNqGOJiplM7e0NzMtwq0k',
        appId: '1:667154830899:web:41bd50e7e29e68be6b3546',
        messagingSenderId: '667154830899',
        projectId: 'instagram-clone-94bcf',
        storageBucket: "instagram-clone-94bcf.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
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
