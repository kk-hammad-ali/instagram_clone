import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/colors.dart';
import 'package:instagram_clone/commons/dimension.dart';

class UpperBar extends StatelessWidget {
  final void Function()? onPressedPost;
  final void Function()? onPressedBack;
  const UpperBar({super.key, this.onPressedPost, this.onPressedBack});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: dimensions.getScreenW(15),
        ),
        IconButton(
          onPressed: onPressedBack,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: dimensions.getScreenW(20),
        ),
        Text(
          'Post to',
          style: TextStyle(
            color: Colors.white,
            fontSize: dimensions.getScreenW(18),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onPressedPost,
              child: Text(
                'Post',
                style: TextStyle(
                  color: blueColor,
                  fontSize: dimensions.getScreenW(18),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: dimensions.getScreenW(15),
        ),
      ],
    );
  }
}
