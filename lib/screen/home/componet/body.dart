import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/colors.dart';
import 'package:instagram_clone/commons/dimension.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return Container(
      width: double.infinity,
      color: mobileBackgroundColor,
      padding:
          EdgeInsets.symmetric(horizontal: dimensions.getScreenWidth * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: dimensions.getScreenW(20),
              vertical: dimensions.getScreenH(20),
            ).copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: dimensions.getScreenW(25),
                  backgroundImage: const NetworkImage(
                      'https://scholar.google.com/intl/en/scholar/images/1x/scholar_logo_64dp.png'),
                ),
                const Expanded(child: Text('Username')),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert_sharp))
              ],
            ),
          ),
          SizedBox(
            height: dimensions.getScreenHeight * 0.32,
            width: double.infinity,
            child: Image.network(
                fit: BoxFit.cover,
                'https://scholar.google.com/intl/en/scholar/images/1x/scholar_logo_64dp.png'),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment_bank_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: dimensions.getScreenH(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w900),
                  child: Text(
                    '1,2323 likes',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: dimensions.getScreenH(10),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: primaryColor),
                      children: [
                        TextSpan(
                          text: 'username  ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: dimensions.getScreenW(15),
                          ),
                        ),
                        const TextSpan(
                          text: 'hey this is new psot descetops',
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: dimensions.getScreenH(6)),
                    child: Text(
                      'View all 100 comments',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: dimensions.getScreenW(16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
