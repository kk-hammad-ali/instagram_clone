import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screen/signin/component/text_fields_signin.dart';
import 'package:instagram_clone/commons/colors.dart';
import 'package:instagram_clone/commons/dimension.dart';
import 'package:instagram_clone/screen/signup/signup_screen.dart';

class BodySigninScreen extends StatelessWidget {
  const BodySigninScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: dimensions.getScreenH(220),
            ),
            SvgPicture.asset(
              "assets/ic_instagram.svg",
              color: primaryColor,
              height: dimensions.getScreenW(60),
            ),
            SizedBox(
              height: dimensions.getScreenH(50),
            ),
            const TextFieldSignin(),
            SizedBox(
              height: dimensions.getScreenH(150),
            ),
            (isAndroid)
                ? RichText(
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: dimensions.getScreenW(18),
                      ),
                      children: [
                        TextSpan(
                          text: " Sign Up",
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: dimensions.getScreenW(20),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return const SignupScreen();
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
                        return const SignupScreen();
                      }));
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: dimensions.getScreenW(20),
                      ),
                    ),
                  ),
            SizedBox(
              height: dimensions.getScreenH(50),
            ),
          ],
        ),
      ),
    );
  }
}
