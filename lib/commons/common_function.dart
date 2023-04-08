import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CommonFunction {
  static navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }


  static pickImage(ImageSource source, context) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    CommonFunction.showSnackBar(
      context,
      "No image selected",
    );
  }

  static showSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
