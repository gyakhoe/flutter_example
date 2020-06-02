import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/screens/activity_screen.dart';
import 'package:flutter_example/instagram_ui_clone/screens/add_post_screen.dart';
import 'package:flutter_example/instagram_ui_clone/screens/explore_screen.dart';
import 'package:flutter_example/instagram_ui_clone/screens/feed_screen.dart';
import 'package:flutter_example/instagram_ui_clone/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  var pages = [
    FeedScreen(),
    ExploreScreen(),
    AddPostScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() => pageIndex = index);
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
