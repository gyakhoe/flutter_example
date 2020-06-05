import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/screens/home_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class AddPostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String screenName;

  const AddPostAppBar({
    Key key,
    @required this.height,
    @required this.screenName,
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
              Navigator.pop(context);
              FlutterStatusbarManager.setHidden(false);
            },
          ),
          FlatButton(
            child: screenName == 'gallery'
                ? Row(
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
                  )
                : Text(
                    screenName == 'camera' ? 'Photo' : 'Video',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
            onPressed: () {},
          ),
          screenName == 'gallery'
              ? FlatButton(
                  child: Text(
                    '   Next',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {},
                )
              : FlatButton(
                  child: Container(),
                  onPressed: () {},
                ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
