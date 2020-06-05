import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/screens/home_screen.dart';

class InstagramMain extends StatelessWidget {
  const InstagramMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram UI Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
