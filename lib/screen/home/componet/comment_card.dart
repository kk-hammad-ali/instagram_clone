import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/dimension.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dimensions.getScreenW(10),
        vertical: dimensions.getScreenH(10),
      ),
      child: ListTile(
        style: ListTileStyle.list,
        leading: CircleAvatar(
          radius: dimensions.getScreenW(20),
          backgroundImage: const NetworkImage(
            'https://images.unsplash.com/photo-1682688759350-050208b1211c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
          ),
        ),
        title: const Text(
          'Username',
        ),
        subtitle: const Text(
          'fsdhfasdjkhfjksdhfjksdhfsdfjfjsdlfjsdklfjasdlfjalsdkhasdkfjsdklfjasdlfjalsdkhalfjalsdkhasdkf',
          style: TextStyle(
            height: 1.5,
          ),
        ),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
      ),
    );
  }
}
