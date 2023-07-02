import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/dimension.dart';

class StoriesCard extends StatelessWidget {
  const StoriesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    List<String> splashImages = [
      'https://images.unsplash.com/photo-1682688759350-050208b1211c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
      'https://plus.unsplash.com/premium_photo-1674902194669-9aadae2f76a1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1687981576001-1417d139c229?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://plus.unsplash.com/premium_photo-1668359409953-d6df18fa8f1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1688216130114-4b5245d70fcc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1687278835925-0f5d6baf8925?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1682687221363-72518513620e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ];
    List<String> usernames = [
      'Insta23',
      'Ninja789',
      'Dreamer42',
      'Seeker56',
      'Guru91',
      'Junkie87',
      'Enthusiast123'
    ];

    return SizedBox(
      height: dimensions.getScreenHeight * 0.20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: splashImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 131, 144, 202),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(splashImages[index]),
                    ),
                  ),
                ),
                SizedBox(
                  height: dimensions.getScreenH(15),
                ),
                Text(usernames[index].substring(0, 6))
              ],
            ),
          );
        },
      ),
    );
  }
}
