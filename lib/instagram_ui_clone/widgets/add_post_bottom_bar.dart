import 'package:flutter/material.dart';

class AddPostBottomBar extends StatefulWidget {
  final double height;
  final ValueChanged<int> onTap;
  const AddPostBottomBar({
    Key key,
    @required this.height,
    @required this.onTap,
  }) : super(key: key);

  @override
  _AddPostBottomBarState createState() => _AddPostBottomBarState();
}

class _AddPostBottomBarState extends State<AddPostBottomBar> {
  bool _isGallery = true;
  bool _isCamera = false;
  bool _isVideo = false;

  TextStyle _selectedStyle =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18);
  TextStyle _unSelectedStyle = TextStyle(
      fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            child: Text(
              'Library',
              style: _isGallery ? _selectedStyle : _unSelectedStyle,
            ),
            onPressed: () {
              setState(() {
                _setFlagTrue(buttonName: 'gallery');
                widget.onTap(0);
              });
            },
          ),
          FlatButton(
            child: Text('Photo',
                style: _isCamera ? _selectedStyle : _unSelectedStyle),
            onPressed: () {
              setState(() {
                _setFlagTrue(buttonName: 'camera');
                widget.onTap(1);
              });
            },
          ),
          FlatButton(
            child: Text(
              'Video',
              style: _isVideo ? _selectedStyle : _unSelectedStyle,
            ),
            onPressed: () {
              setState(() {
                _setFlagTrue(buttonName: 'video');
                widget.onTap(2);
              });
            },
          ),
        ],
      ),
    );
  }

  void _setFlagTrue({@required String buttonName}) {
    if (buttonName == 'gallery') {
      _isGallery = true;
      _isCamera = false;
      _isVideo = false;
    } else if (buttonName == 'camera') {
      _isGallery = false;
      _isCamera = true;
      _isVideo = false;
    } else {
      _isGallery = false;
      _isCamera = false;
      _isVideo = true;
    }
  }
}
