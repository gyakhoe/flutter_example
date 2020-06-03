import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class InstaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const InstaAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(top: 20),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Feather.camera,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          Text(
            'Instagram',
            style: GoogleFonts.cookie(
              color: Colors.white,
              fontSize: 36,
            ),
          ),
          IconButton(
            icon: Icon(
              Feather.send,
              color: Colors.white,
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
