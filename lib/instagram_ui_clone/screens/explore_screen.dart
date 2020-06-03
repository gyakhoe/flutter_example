import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/explore_app_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExploreAppBar(height: 108),
      body: Center(
        child: Text('Explore Screen Screen'),
      ),
    );
  }
}
