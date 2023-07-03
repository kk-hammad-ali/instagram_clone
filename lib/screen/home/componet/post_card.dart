import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/colors.dart';
import 'package:instagram_clone/commons/dimension.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';
import 'package:instagram_clone/provider/like_provider.dart';
import 'package:instagram_clone/screen/home/componet/comments_section.dart';
import 'package:instagram_clone/screen/home/componet/like_animation.dart';
import 'package:instagram_clone/screen/home/componet/stories_card.dart';
import 'package:instagram_clone/services/post_firebase.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> snapshot;
  const PostCard({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final likesProvider = Provider.of<LikesProvider>(context, listen: false);
    return Container(
      width: double.infinity,
      color: mobileBackgroundColor,
      padding:
          EdgeInsets.symmetric(horizontal: dimensions.getScreenWidth * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StoriesCard(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: dimensions.getScreenW(10),
              vertical: dimensions.getScreenH(10),
            ).copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: dimensions.getScreenW(20),
                  backgroundImage: NetworkImage(
                    snapshot[constPostUserProfileURL],
                  ),
                ),
                SizedBox(
                  width: dimensions.getScreenW(10),
                ),
                Expanded(child: Text(snapshot[constPostUserName])),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert_sharp))
              ],
            ),
          ),
          GestureDetector(
            onDoubleTap: () {
              likesProvider.setLikeAnimated(true);
              PostService().updateLikes(
                  snapshot[constPostId], snapshot[constPostUserId], context);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: dimensions.getScreenHeight * 0.30,
                  width: double.infinity,
                  child: Image.network(
                    snapshot[constPostImageURL],
                    fit: BoxFit.cover,
                  ),
                ),
                Consumer<LikesProvider>(builder: (context, likesProvider, _) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: likesProvider.isLikeAnimated ? 1 : 0,
                    child: LikeAnimation(
                      isAnimated: likesProvider.isLikeAnimated,
                      duration: const Duration(milliseconds: 100),
                      child: const Icon(
                        Icons.favorite,
                        size: 100,
                        color: primaryColor,
                      ),
                      onEnd: () {
                        likesProvider.setLikeAnimated(false);
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LikeAnimation(
                isAnimated: snapshot[constPostLikes].contains(currentUID),
                smallLike: true,
                child: IconButton(
                  onPressed: () {
                    PostService().updateLikes(snapshot[constPostId],
                        snapshot[constPostUserId], context);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: snapshot[constPostLikes].contains(currentUID)
                        ? Colors.red
                        : Colors.white,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CommentSection(
                      postID: snapshot[constPostId],
                    ),
                  ),
                ),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w900),
                  child: Text(
                    '${snapshot[constPostLikes].length} likes',
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
                          text: '${snapshot[constPostUserName]}  ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: dimensions.getScreenW(15),
                          ),
                        ),
                        TextSpan(
                          text: snapshot[constPostDescrption],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CommentSection(
                        postID: snapshot[constPostId],
                      ),
                    ),
                  ),
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
