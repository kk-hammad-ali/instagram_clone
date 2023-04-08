import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/dimension.dart';

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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFoucs.dispose();
    super.dispose();
  }

  void _submitFrom() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    final borders = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    final AppDimensions dimensions = AppDimensions(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_passwordFoucs),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty ||
                  !value.contains('@') ||
                  !value.contains('.')) {
                return 'Please enter a valid email';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: const TextStyle(color: Colors.white),
              enabledBorder: borders,
              focusedBorder: borders,
              errorBorder: borders,
            ),
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
              child: const Text('Signin'),
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
