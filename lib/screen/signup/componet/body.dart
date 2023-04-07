import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screen/signup/componet/text_fields_signup.dart';
import 'package:instagram_clone/commons/colors.dart';
import 'package:instagram_clone/commons/dimension.dart';

class BodySignupScreen extends StatelessWidget {
  static String routeName = "/signin";
  const BodySignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            SvgPicture.asset(
              "assets/ic_instagram.svg",
              color: primaryColor,
              height: dimensions.getScreenW(60),
            ),
            SizedBox(
              height: dimensions.getScreenH(50),
            ),
            const TextFieldSignUp(),
                        Flexible(
              flex: 2,
              child: Container(),
            ),
            RichText(
              text: TextSpan(
                text: "Already an account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: dimensions.getScreenW(18),
                ),
                children: [
                  TextSpan(
                    text: " Signin",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: dimensions.getScreenW(20),
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  )
                ],
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
