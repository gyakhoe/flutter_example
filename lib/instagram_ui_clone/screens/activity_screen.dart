import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/activity_app_bar.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActivityAppBar(height: 65),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColorDark,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Text(
                'This Week',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
            _followActivityTile(),
            _postActivityTile(activityName: 'mention')
          ],
        ),
      ),
    );
  }

  Widget _followActivityTile() {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
      ),
      title: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'tenzin_choekyii',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' started following you.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: ' 2d',
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
        ]),
      ),
      //* Need some gesture detection over here to convert follow to following
      trailing: Container(
        width: 85,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            'Follow',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _postActivityTile({
    @required String activityName,
  }) {
    return ListTile(
      isThreeLine: true,
      contentPadding: EdgeInsets.only(left: 10),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'ttruuselph',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' mentioned you in a comment:',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: ' @gyakhoe',
              style: TextStyle(
                color: Colors.blue[100],
              ),
            ),
            TextSpan(
              text: '  jpt journalist n jpt reporting',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: ' 3d',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.favorite_border,
              size: 12,
              color: Colors.grey[400],
            ),
            SizedBox(width: 10),
            Text(
              'Reply',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400]),
            ),
          ],
        ),
      ),
      //* Need some gesture detection over here to convert follow to following
      trailing: Container(
        width: 45,
        height: 45,
        color: Colors.pink,
        child: Image(
          image: NetworkImage(Utils.listOfImageUrl.elementAt(33)),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
