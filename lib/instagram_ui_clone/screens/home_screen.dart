import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/data/models/post.dart';
import 'package:flutter_example/instagram_ui_clone/data/models/story.dart';
import 'package:flutter_example/instagram_ui_clone/data/repositories/feed_repo.dart';
import 'package:flutter_example/instagram_ui_clone/screens/activity_screen.dart';
import 'package:flutter_example/instagram_ui_clone/screens/add_post_screen.dart';
import 'package:flutter_example/instagram_ui_clone/screens/explore_screen.dart';
import 'package:flutter_example/instagram_ui_clone/screens/feed_screen.dart';
import 'package:flutter_example/instagram_ui_clone/screens/profile_screen.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  Future<List<Story>> _futureListOfStory;
  Future<List<Post>> _futureListOfPost;

  @override
  void initState() {
    super.initState();
    _futureListOfStory = FeedRepo.getFutureListOfStoryFromJson();
    _futureListOfPost = FeedRepo.getFutureListOfPostFromJson();
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      FeedScreen(
        futureListOfStory: _futureListOfStory,
        futureListOfPost: _futureListOfPost,
      ),
      ExploreScreen(),
      AddPostScreen(),
      ActivityScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: pageIndex,
        onTap: (index) {
          if (index == 2) {
            FlutterStatusbarManager.setHidden(true)
                .then((_) => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AddPostScreen();
                      },
                    )));
          } else {
            setState(() {
              pageIndex = index;
            });
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add Post'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Activity'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
