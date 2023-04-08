import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/commons/common_function.dart';
import 'package:instagram_clone/commons/dimension.dart';
import 'package:instagram_clone/services/auth_firebase.dart';
import 'package:instagram_clone/widget/reusbale_fields.dart';

class TextFieldSignUp extends StatefulWidget {
  const TextFieldSignUp({super.key});

  @override
  State<TextFieldSignUp> createState() => _TextFieldSignUpState();
}

class _TextFieldSignUpState extends State<TextFieldSignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFoucs = FocusNode();
  final FocusNode _emailFoucs = FocusNode();
  final FocusNode _addressFoucs = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureTrue = true;
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFoucs.dispose();
    _emailFoucs.dispose();
    _addressFoucs.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> selectedImage(ImageSource source) async {
    Uint8List image = await CommonFunction.pickImage(source, context);
    setState(() {
      _image = image;
    });
  }

  void _submitFrom() {
    setState(() {
      _isLoading = true;
    });
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      setState(() {
        _isLoading = false;
      });
    }
    if (isValid) {
      if (_image == null) {
        CommonFunction.showSnackBar(
          context,
          "No image selected",
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }
      AuthServices().createAccountWithEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
        username: _usernameController.text,
        bio: _bioController.text,
        profileimage: _image!,
      );
      return;
    } else {
      setState(() {
        _isLoading = false;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final borders = OutlineInputBorder(
      borderSide: Divider.createBorderSide(
        context,
        color: Colors.white.withOpacity(0.5),
      ),
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Stack(
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 65,
                      backgroundImage: MemoryImage(_image!),
                      backgroundColor: Colors.red,
                    )
                  : const CircleAvatar(
                      radius: 65,
                      backgroundImage:
                          NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                      backgroundColor: Colors.red,
                    ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: () => _showBottomSheet(context),
                  icon: const Icon(Icons.add_a_photo),
                ),
              )
            ],
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          ResuableField(
            controller: _usernameController,
            hintText: 'Username',
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_emailFoucs),
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is missing';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
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
          passwordField(context, borders),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          bioFeild(borders),
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

  TextFormField bioFeild(OutlineInputBorder borders) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onEditingComplete: _submitFrom,
      controller: _bioController,
      focusNode: _addressFoucs,
      keyboardType: TextInputType.streetAddress,
      style: const TextStyle(color: Colors.white),
      maxLines: 2,
      decoration: InputDecoration(
        hintText: 'Bio',
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: borders,
        focusedBorder: borders,
        errorBorder: borders,
      ),
    );
  }

  TextFormField passwordField(
      BuildContext context, OutlineInputBorder borders) {
    return TextFormField(
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
    );
  }

  void _showBottomSheet(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(dimensions.getScreenW(20)),
          topRight: Radius.circular(dimensions.getScreenW(20)),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                selectedImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () {
                selectedImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
