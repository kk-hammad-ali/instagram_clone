import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_clone/commons/dimension.dart';
import 'package:instagram_clone/services/auth_firebase.dart';
import 'package:instagram_clone/widget/reusbale_fields.dart';

class TextFieldSignin extends StatefulWidget {
  const TextFieldSignin({super.key});

  @override
  State<TextFieldSignin> createState() => _TextFieldSigninState();
}

class _TextFieldSigninState extends State<TextFieldSignin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFoucs = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureTrue = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFoucs.dispose();
    super.dispose();
  }

  void _submitFrom() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    if (isValid) {
      await AuthServices().loginUserWithEmailPassword(
        email: _emailController.text.toLowerCase().trim(),
        password: _passwordController.text,
        context: context,
      );
    } else {}
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final borders = OutlineInputBorder(
      borderSide: Divider.createBorderSide(
        context,
        color: Colors.white.withOpacity(0.5),
      ),
    );
    final AppDimensions dimensions = AppDimensions(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ResuableField(
            controller: _emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_passwordFoucs),
            validator: (value) {
              if (value!.isEmpty ||
                  !value.contains('@') ||
                  !value.contains('.')) {
                return 'Please enter a valid email';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            onEditingComplete: _submitFrom,
            controller: _passwordController,
            focusNode: _passwordFoucs,
            obscureText: _obscureTrue,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value!.isEmpty || value.length < 8) {
                return 'Please enter a valid password';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureTrue = !_obscureTrue;
                  });
                },
                child: Icon(
                  _obscureTrue ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
              hintText: 'Password',
              hintStyle: const TextStyle(color: Colors.white),
              enabledBorder: borders,
              focusedBorder: borders,
              errorBorder: borders,
            ),
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          GestureDetector(
            onTap: _submitFrom,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding:
                  EdgeInsets.symmetric(vertical: dimensions.getScreenH(10)),
              decoration: ShapeDecoration(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    dimensions.getScreenW(4),
                  ),
                ),
              ),
              child: !_isLoading
                  ? const Text(
                      'Sign up',
                    )
                  : Center(
                      child: SpinKitRotatingCircle(
                        color: Colors.white,
                        size: dimensions.getScreenH(20),
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
        ],
      ),
    );
  }
}
