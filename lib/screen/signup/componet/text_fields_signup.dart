import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/dimension.dart';

class TextFieldSignUp extends StatefulWidget {
  const TextFieldSignUp({super.key});

  @override
  State<TextFieldSignUp> createState() => _TextFieldSignUpState();
}

class _TextFieldSignUpState extends State<TextFieldSignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioaddressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFoucs = FocusNode();
  final FocusNode _emailFoucs = FocusNode();
  final FocusNode _addressFoucs = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureTrue = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFoucs.dispose();
    _emailFoucs.dispose();
    _addressFoucs.dispose();
    _bioaddressController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _submitFrom() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final borders = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 65,
                backgroundImage:
                    NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                backgroundColor: Colors.red,
              ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_a_photo),
                ),
              )
            ],
          ),
          SizedBox(
            height: dimensions.getScreenH(10),
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_emailFoucs),
            controller: _usernameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is missing';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Usermame',
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
            focusNode: _emailFoucs,
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
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_addressFoucs),
            textInputAction: TextInputAction.next,
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
          TextFormField(
            textInputAction: TextInputAction.done,
            onEditingComplete: () => _submitFrom,
            controller: _bioaddressController,
            focusNode: _addressFoucs,
            keyboardType: TextInputType.streetAddress,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Bio',
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
              child: const Text('Signup'),
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
