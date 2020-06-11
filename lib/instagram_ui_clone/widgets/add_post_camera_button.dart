import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget cameraOptions() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Feather.rotate_ccw,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Ionicons.ios_flash,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    ),
  );
}
