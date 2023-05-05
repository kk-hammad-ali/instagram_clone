import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';
import 'package:instagram_clone/commons/responsive/mobile_layout.dart';
import 'package:instagram_clone/commons/responsive/responsive_layout_controller.dart';
import 'package:instagram_clone/commons/responsive/web_layout.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/screen/signin/sigin_screen.dart';
import 'package:instagram_clone/commons/colors.dart';

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
            home: StreamBuilder(
              stream: firebaseAuth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const ResponsiveLayout(
                      webScreen: WebScreenLayout(),
                      mobileScreen: MobileScreenLayout(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Some internal error occure'),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }
                return const SigninScreen();
              },
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Instagram',
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: mobileBackgroundColor,
            ),
            home: StreamBuilder(
              stream: firebaseAuth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const ResponsiveLayout(
                      webScreen: WebScreenLayout(),
                      mobileScreen: MobileScreenLayout(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Some internal error occure'),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }
                return const SigninScreen();
              },
            ),
          );
  }
}
