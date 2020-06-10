import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/insta_app_bar.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/profile_tab_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileScreenV1 extends StatefulWidget {
  const ProfileScreenV1({Key key}) : super(key: key);

  @override
  _ProfileScreenV1State createState() => _ProfileScreenV1State();
}

class _ProfileScreenV1State extends State<ProfileScreenV1> {
  int _pageIndex = 0;
  int _mediaIndex = 0;
  @override
  Widget build(BuildContext context) {
    var _screen = MediaQuery.of(context).size;
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
            _profileStats(_screen),
            _bio(),
            _editProfile(),
            _storyHighlight(),
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
            // SliverStaggeredGrid.countBuilder(
            //   crossAxisSpacing: 2,
            //   mainAxisSpacing: 2,
            //   crossAxisCount: _pageIndex != 1 ? 3 : 2,
            //   staggeredTileBuilder: (index) => StaggeredTile.count(
            //       _pageIndex != 1 ? 1 : 1, _pageIndex != 1 ? 1 : 1.5),
            //   itemBuilder: (contex, index) {
            //     return Container(
            //       color: Colors.grey[500],
            //       child: Image(
            //         image: NetworkImage(Utils.listOfImageUrl.elementAt(index)),
            //       ),
            //     );
            //   },
            //   itemCount: Utils.listOfImageUrl.length,
            //   key: GlobalKey(),
            // ),
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
            // GridView.count(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   crossAxisSpacing: 2,
            //   mainAxisSpacing: 2,
            //   crossAxisCount: _pageIndex == 1 ? 2 : 3,
            //   children: List.generate(
            //     Utils.listOfImageUrl.length,
            //     (index) => _pageIndex != 1
            //         ? Container(
            //             color: Theme.of(context).primaryColor,
            //             child: Image(
            //                 fit: BoxFit.cover,
            //                 image: NetworkImage(
            //                     Utils.listOfImageUrl.elementAt(index))),
            //           )
            //         : Container(
            //             width: _screen.width / 2 - 5,
            //             height: 300,
            //             decoration: BoxDecoration(
            //               color: Colors.black,
            //             ),
            //           ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildThreeImageInRow() {
    print('build Three image is called');

    _mediaIndex = _mediaIndex + 3;
    print('media index value is $_mediaIndex');

    return _mediaIndex - 3 <= Utils.listOfImageUrl.length
        ? Row(
            children: [
              _mediaIndex - 3 <= Utils.listOfImageUrl.length
                  ? _squareImageBox(
                      Utils.listOfImageUrl.elementAt(_mediaIndex - 3))
                  : null,
              _mediaIndex - 3 <= Utils.listOfImageUrl.length
                  ? _squareImageBox(
                      Utils.listOfImageUrl.elementAt(_mediaIndex - 2))
                  : null,
              _mediaIndex - 3 <= Utils.listOfImageUrl.length
                  ? _squareImageBox(
                      Utils.listOfImageUrl.elementAt(_mediaIndex - 1))
                  : null,
            ],
          )
        : null;
  }

  Widget _squareImageBox(String imageUrl) {
    return Container(
      height: MediaQuery.of(context).size.width / 3,
      width: MediaQuery.of(context).size.width / 3,
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
          imageUrl,
        ),
      ),
    );
  }

  Widget _profileStats(Size screen) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      color: Theme.of(context).primaryColor,
      height: 100,
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _profileAvatar(
                height: 100,
                width: 100,
              ),
            ),
          ),
          Container(
            width: screen.width - 100 - 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _statsBox(count: '57', title: 'Posts'),
                _statsBox(count: '185', title: 'Followers'),
                _statsBox(count: '241', title: 'Following'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bio() {
    return Container(
      color: Colors.teal,
      height: 100,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'GS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'All photos are '),
                TextSpan(
                  text: '#shotoniphone ',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                  ),
                ),
                TextSpan(
                  text:
                      'unless stated otherwise. NTS-\"Have teh courage to follow your heart and intuation.\" ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                    text: '#100daysofcode #flutterdeveloper',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                    ))
              ],
            ),
          ),
          Text(
            'gyakhoe.com',
            style: TextStyle(
              color: Colors.pinkAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _editProfile() {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 30,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[500]),
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColorDark,
        ),
        child: Center(
            child: Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
    );
  }

  Widget _storyHighlight() {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Story Highligts',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _statsBox({
    @required String count,
    @required String title,
  }) {
    return Container(
      height: 98,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            count,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _profileAvatar({
    @required double height,
    @required double width,
    bool isStorySeen = false,
  }) {
    return Container(
      height: height, //155,
      width: width, //155,
      child: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height, // 150,
                width: width, //150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isStorySeen ? Colors.grey[500] : Colors.red,
                      width: 3,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height - 10, //140,
                width: width - 10, //140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(Utils.getRandomImageUrl()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
