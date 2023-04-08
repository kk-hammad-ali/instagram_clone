import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResuableField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;

  const ResuableField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borders = OutlineInputBorder(
      borderSide: Divider.createBorderSide(
        context,
        color: Colors.white.withOpacity(0.5),
      ),
    );
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoTextField(
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        textInputAction: textInputAction,
        onSubmitted: onFieldSubmitted,
        style: const TextStyle(color: Colors.white),
        placeholder: hintText,
        placeholderStyle: const TextStyle(color: Colors.white),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
      );
    } else {
      return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: borders,
          focusedBorder: borders,
          errorBorder: borders,
        ),
      );
    }
  }
}
