import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/insta_app_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstaAppBar(
        height: 65,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 98,
              color: Theme.of(context).primaryColorDark,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _storyAvatar(height: 98, width: 98),
                  _storyAvatar(height: 98, width: 98),
                  _storyAvatar(height: 98, width: 98),
                  _storyAvatar(height: 98, width: 98),
                  _storyAvatar(height: 98, width: 98),
                  _storyAvatar(height: 98, width: 98),
                  _storyAvatar(height: 98, width: 98),
                  _storyAvatar(height: 98, width: 98),
                  _storyAvatar(height: 98, width: 98),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 65 - 98 - 56,
              color: Theme.of(context).primaryColorDark,
              child: ListView(
                children: [
                  _postWidget(),
                  _postWidget(),
                  _postWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _postWidget() {
    return Container(
      height: 500,
      child: Column(
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
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1514846326710-096e4a8035e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'routineofnepalbanda',
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
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1509460913899-515f1df34fea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
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
                          Feather.heart,
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
                    Feather.bookmark,
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
                    Text('8,513 likes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    RichText(
                      text: TextSpan(
                        text: 'routineofnepalbanda',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text:
                                ' Nepal Army completed the making of quarantine sites (Almost 68 beds) in the jungle of Doti .. more',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'View all 15 comments',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      '37 minutes ago',
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
                            color: Colors.red,
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
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1568967729548-e3dbad3d37e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Helloaaaaaaaaaaaaaaa',
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
