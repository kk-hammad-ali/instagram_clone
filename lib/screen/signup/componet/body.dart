import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screen/signin/sigin_screen.dart';
import 'package:instagram_clone/screen/signup/componet/text_fields_signup.dart';
import 'package:instagram_clone/commons/colors.dart';
import 'package:instagram_clone/commons/dimension.dart';

class BodySignupScreen extends StatelessWidget {
  static String routeName = "/signin";
  const BodySignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final isAndroid = Theme.of(context).platform == TargetPlatform.android;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: dimensions.getScreenH(30),
            ),
            SvgPicture.asset(
              "assets/ic_instagram.svg",
              color: primaryColor,
              height: dimensions.getScreenW(60),
            ),
            SizedBox(
              height: dimensions.getScreenH(20),
            ),
            const TextFieldSignUp(),
            SizedBox(
              height: dimensions.getScreenH(50),
            ),
            (isAndroid)
                ? RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: dimensions.getScreenW(18),
                      ),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: dimensions.getScreenW(20),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return const SigninScreen();
                              }));
                            },
                        )
                      ],
                    ),
                  )
                : CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const SigninScreen();
                      }));
                    },
                    child: Text(
                      "Already have an account? Sign In",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: dimensions.getScreenW(20),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
