import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/profile_tab_bar.dart';

class ProfileTabScreen extends StatefulWidget {
  ProfileTabScreen({Key key}) : super(key: key);

  @override
  _ProfileTabScreenState createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 120,
      width: MediaQuery.of(context).size.width,
      color: Colors.pink,
      child: Column(
        children: <Widget>[
          ProfileTabBar(
            height: 45,
            onTap: (value) {
              setState(() {
                tabIndex = value;
              });
            },
          ),
          Container(
            color: Colors.teal[100],
            height: MediaQuery.of(context).size.height - 120 - 45,
            child: _tabScreens(context, tabIndex),
          )
        ],
      ),
    );
  }

  Widget _tabScreens(BuildContext context, int index) {
    var _gridPages = [
      GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          children: List.generate(
              Utils.listOfImageUrl.length,
              (index) => Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    child: Image(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage(Utils.listOfImageUrl.elementAt(index)),
                    ),
                  ))),
      Text('2'),
      Text('3'),
    ];

    return _gridPages[index];
  }
}
