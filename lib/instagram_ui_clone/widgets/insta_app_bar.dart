import 'package:flutter/material.dart';

class InstaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool isProfileScreen;
  final Widget leading;
  final Widget center;
  final Widget trailing;
  final Color backgroundColor;

  const InstaAppBar({
    Key key,
    @required this.height,
    this.leading,
    @required this.center,
    this.trailing,
    this.isProfileScreen = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(top: 20),
      color: backgroundColor == null
          ? Theme.of(context).primaryColor
          : backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: isProfileScreen
                ? Container()
                : Align(
                    alignment: Alignment.centerLeft,
                    child: leading,
                  ),
          ),
          Expanded(
            child: Center(
              child: center,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: trailing,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
