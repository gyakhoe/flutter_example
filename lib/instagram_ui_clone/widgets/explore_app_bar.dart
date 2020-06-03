import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ExploreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const ExploreAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: height - 20,
            child: Column(
              children: [
                Container(
                  height: (height - 20) / 2,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[600],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 335,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(AntDesign.scan1),
                    ],
                  ),
                ),
                Container(
                  height: (height - 20) / 2,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      _exploreTiles(
                        icon: Feather.tv,
                        title: 'IGTV',
                        context: context,
                      ),
                      _exploreTiles(
                        icon: Feather.shopping_bag,
                        title: 'Shop',
                        context: context,
                      ),
                      _exploreTiles(
                        title: 'Decor',
                        context: context,
                      ),
                      _exploreTiles(
                        title: 'Travel',
                        context: context,
                      ),
                      _exploreTiles(
                        title: 'Architecture',
                        context: context,
                      ),
                      _exploreTiles(
                        title: 'Food',
                        context: context,
                      ),
                      _exploreTiles(
                        title: 'Art',
                        context: context,
                      ),
                      _exploreTiles(
                        title: 'Style',
                        context: context,
                      ),
                      _exploreTiles(
                        title: 'TV & Movies',
                        context: context,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _exploreTiles({
    IconData icon,
    @required String title,
    @required BuildContext context,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: ((height - 20) / 2) - 10,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
