import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/insta_app_bar.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/profile_tab_bar.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/profile_widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var _screen = MediaQuery.of(context).size;
    var _primaryColor = Theme.of(context).primaryColor;
    var _primaryColorDark = Theme.of(context).primaryColorDark;
    return Scaffold(
      appBar: InstaAppBar(
        height: 60,
        isProfileScreen: true,
        center: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'gyakhoe',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            SimpleLineIcons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            profileStats(screen: _screen, color: _primaryColor),
            bio(primaryColor: _primaryColor),
            editProfile(
              primaryColorDark: _primaryColorDark,
              primaryColor: _primaryColor,
            ),
            storyHighlight(primaryColor: _primaryColor),
            Divider(
              height: 1,
              color: Colors.grey[500],
            ),
            ProfileTabBar(
              height: 46,
              onTap: (value) {
                setState(() {
                  _pageIndex = value;
                });
              },
            ),
            StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: _pageIndex != 1 ? 3 : 2,
              itemCount: Utils.listOfImageUrl.length,
              itemBuilder: (contex, index) {
                return Container(
                  padding:
                      _pageIndex == 1 ? EdgeInsets.all(5) : EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: _pageIndex == 1
                        ? BorderRadius.circular(15)
                        : BorderRadius.circular(0),
                    child: Image(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage(Utils.listOfImageUrl.elementAt(index)),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.count(
                  _pageIndex != 1 ? 1 : 1, _pageIndex != 1 ? 1 : 1.5),
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
          ],
        ),
      ),
    );
  }
}
