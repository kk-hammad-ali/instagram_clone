import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/dimension.dart';
import 'package:instagram_clone/screen/post/componet/upper_bar.dart';

class BodyAddPostScreen extends StatelessWidget {
  const BodyAddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);

    return SafeArea(
      child: Column(
        children: [
          const UpperBar(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1674574124349-0928f4b2bce3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80'),
              ),
              SizedBox(
                width: dimensions.getScreenWidth * 0.5,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a caption',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1674574124349-0928f4b2bce3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80'),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
