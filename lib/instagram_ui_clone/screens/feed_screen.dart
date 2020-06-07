import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';
import 'package:flutter_example/instagram_ui_clone/data/models/post.dart';
import 'package:flutter_example/instagram_ui_clone/data/models/story.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/insta_app_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedScreen extends StatelessWidget {
  final Future<List<Story>> futureListOfStory;
  final Future<List<Post>> futureListOfPost;
  const FeedScreen({
    Key key,
    @required this.futureListOfStory,
    @required this.futureListOfPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstaAppBar(
        height: 65,
        leading: IconButton(
          icon: Icon(
            Feather.camera,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        center: Text(
          'Instagram',
          style: GoogleFonts.cookie(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Feather.send,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColorDark,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 98,
                color: Theme.of(context).primaryColorDark,
                child: FutureBuilder(
                  future: futureListOfStory,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Story> _storyList = snapshot.data;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _storyList.length,
                        itemBuilder: (context, index) {
                          return _storyAvatar(
                            height: 98,
                            width: 98,
                            story: _storyList.elementAt(index),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      print('error in Snapshot');
                      return Text('Error occured');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              );
            }
            return Container(
              child: FutureBuilder(
                future: futureListOfPost,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Post> _postList = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _postList.length,
                      itemBuilder: (context, index) {
                        return _postWidget(post: _postList.elementAt(index));
                      },
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _postWidget({@required Post post}) {
    return Container(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(post.profileImageUrl),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          post.username,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Feather.more_horizontal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: NetworkImage(post.postMediaUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          post.isLiked ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          FontAwesome.comment_o,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Feather.send,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    post.isSaved
                        ? FontAwesome.bookmark
                        : FontAwesome.bookmark_o,
                    color: Colors.white,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${post.likeCount} likes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    RichText(
                      text: TextSpan(
                        text: post.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: ' ${post.postCaption}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'View all ${post.commentCount} comments',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      '${Utils.getTimeDifference(post.postCreationDate)}',
                      style: TextStyle(color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _storyAvatar({
    @required double height,
    @required double width,
    @required Story story,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.5),
      height: height - 30, //155,
      width: width - 30, //155,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height - 30, //155,
            width: width - 30, //155,
            child: Center(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: height - 30, // 150,
                      width: width - 30, //150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: story.isSeen ? Colors.grey[500] : Colors.red,
                            width: 3,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: height - 40, //140,
                      width: width - 40, //140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(story.imageUrl),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            story.username,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
