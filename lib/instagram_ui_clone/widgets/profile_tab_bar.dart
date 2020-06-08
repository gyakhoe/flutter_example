import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfileTabBar extends StatefulWidget {
  final double height;
  final ValueChanged<int> onTap;

  ProfileTabBar({
    Key key,
    @required this.height,
    @required this.onTap,
  }) : super(key: key);

  @override
  _ProfileTabBarState createState() => _ProfileTabBarState();
}

class _ProfileTabBarState extends State<ProfileTabBar> {
  bool isPost = true;
  bool isTv = false;
  bool isTag = false;

  final Color _selectedColor = Colors.white;
  final Color _unSelectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: widget.height,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
              child: Container(
                width: _screenWidth / 3,
                height: widget.height,
                color: Colors.amber,
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Icon(
                        Icons.grid_on,
                        color: isTv ? _selectedColor : _unSelectedColor,
                      ),
                    ),
                    isPost
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              onTap: () {
                if (!isPost) {
                  setState(() {
                    setFlags(tabName: 'post');
                    widget.onTap(0);
                  });
                }
              }),
          GestureDetector(
            child: Container(
              width: _screenWidth / 3,
              height: widget.height,
              color: Colors.pinkAccent,
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Icon(
                      Feather.tv,
                      color: isTv ? _selectedColor : _unSelectedColor,
                    ),
                  ),
                  isTv
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            onTap: () {
              if (!isTv) {
                setState(() {
                  setFlags(tabName: 'tv');
                  widget.onTap(1);
                });
              }
            },
          ),
          GestureDetector(
            child: Container(
              width: _screenWidth / 3,
              height: widget.height,
              color: Colors.teal,
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Icon(
                      Icons.assignment_ind,
                      color: isTag ? _selectedColor : _unSelectedColor,
                    ),
                  ),
                  isTag
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            onTap: () {
              if (!isTag) {
                setState(() {
                  setFlags(tabName: 'tag');
                  widget.onTap(2);
                });
              }
            },
          ),
        ],
      ),
    );
  }

  setFlags({String tabName}) {
    switch (tabName) {
      case 'post':
        isTv = false;
        isTag = false;
        isPost = true;
        break;

      case 'tv':
        isTv = true;
        isTag = false;
        isPost = false;
        break;

      case 'tag':
        isTv = false;
        isTag = true;
        isPost = false;
        break;
    }
  }
}
