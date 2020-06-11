import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';

Widget profileStats({Size screen, Color color}) {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10),
    color: color,
    height: 100,
    child: Row(
      children: <Widget>[
        Container(
          width: 100,
          child: Align(
            alignment: Alignment.centerLeft,
            child: profileAvatar(
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
              statsBox(count: '57', title: 'Posts'),
              statsBox(count: '185', title: 'Followers'),
              statsBox(count: '241', title: 'Following'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget bio({@required Color primaryColor}) {
  return Container(
    color: primaryColor,
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

Widget editProfile(
    {@required Color primaryColor, @required Color primaryColorDark}) {
  return Container(
    color: primaryColor,
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Container(
      height: 30,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]),
        borderRadius: BorderRadius.circular(5),
        color: primaryColorDark,
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

Widget storyHighlight({@required primaryColor}) {
  return Container(
    color: primaryColor,
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

Widget statsBox({
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

Widget profileAvatar({
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
