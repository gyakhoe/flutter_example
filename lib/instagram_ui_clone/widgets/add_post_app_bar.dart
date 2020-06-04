import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/screens/home_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class AddPostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const AddPostAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Theme.of(context).primaryColorDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
              FlutterStatusbarManager.setHidden(false);
            },
          ),
          FlatButton(
            child: Row(
              children: [
                Text(
                  'Recent',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Ionicons.ios_arrow_down,
                  color: Colors.white,
                )
              ],
            ),
            onPressed: () {},
          ),
          FlatButton(
            child: Text(
              '   Next',
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: 18,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
