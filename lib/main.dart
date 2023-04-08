import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/screen/signin/sigin_screen.dart';
import 'package:instagram_clone/commons/colors.dart';
import 'package:instagram_clone/commons/routes.dart';

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

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return isIOS
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: 'Instagram',
            home: const SigninScreen(),
            routes: routes,
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Instagram',
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: mobileBackgroundColor,
            ),
            initialRoute: SigninScreen.routeName,
            routes: routes,
          );
  }
}
