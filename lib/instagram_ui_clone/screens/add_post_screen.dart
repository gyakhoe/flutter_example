import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/add_post_app_bar.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/add_post_bottom_bar.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddPostAppBar(
        height: 45,
      ),
      body: Center(
        child: Text('Add Post Screen'),
      ),
      bottomNavigationBar: AddPostBottomBar(
        onTap: (value) {
          print(value);
        },
        height: 45,
      ),
    );
  }
}
