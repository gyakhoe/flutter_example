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
                leading: Text('This Week',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16))),
            _followActivityTile(
                context: context,
                followerUsername: 'tenzin_choekyi',
                followerImageUrl: Utils.getRandomImageUrl(),
                isFollowed: false),
            _commnetActivityTIle(
                isMention: true,
                otherUsername: 'ttruselph',
                otherUserProfileImageUrl: Utils.getRandomImageUrl(),
                comment: 'jpt journalist n jpt reporting',
                commentedOnMediaUrl: Utils.getRandomImageUrl()),
            _followActivityTile(
                context: context,
                followerUsername: 'gyalmo20',
                followerImageUrl: Utils.getRandomImageUrl()),
            _commnetActivityTIle(
                isMention: true,
                comment: '😂',
                otherUsername: 'codepower.io',
                otherUserProfileImageUrl: Utils.getRandomImageUrl(),
                commentedOnMediaUrl: Utils.getRandomImageUrl()),
            _commnetActivityTIle(
                isMention: false,
                comment:
                    'Haha. One that fools around a lot but gets there workd done some how. 😂😂😂',
                otherUsername: 'codepower.io',
                otherUserProfileImageUrl: Utils.getRandomImageUrl(),
                commentedOnMediaUrl: Utils.getRandomImageUrl()),
            Divider(color: Colors.grey[500]),
            ListTile(
                leading: Text('This Month',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16))),
            _likedOnPost(
              likedUsernames:
                  List.generate(100000, (index) => 'apple${index.toString()}'),
              postUrl: Utils.getRandomImageUrl(),
              likedUserImageUrls:
                  List.generate(2, (index) => Utils.getRandomImageUrl()),
            ),
            _followActivityTile(
                context: context,
                followerUsername: 'himani_mudgil',
                followerImageUrl: Utils.getRandomImageUrl(),
                isFollowed: true),
            _followActivityTile(
                context: context,
                followerUsername: 'ngawang_94',
                followerImageUrl: Utils.getRandomImageUrl(),
                isFollowed: true),
            _followActivityTile(
                context: context,
                followerUsername: 'thokmey_tenzi',
                followerImageUrl: Utils.getRandomImageUrl()),
          ],
        ),
      ),
    );
  }

  Widget _followActivityTile({
    @required BuildContext context,
    @required String followerUsername,
    @required String followerImageUrl,
    bool isFollowed = false,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(followerImageUrl),
      ),
      title: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: followerUsername,
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
        width: isFollowed ? 95 : 85,
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isFollowed ? Theme.of(context).primaryColorDark : Colors.pink,
          border: isFollowed
              ? Border.all(
                  color: Colors.grey[500],
                )
              : Border.all(width: 0),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            isFollowed ? 'Following' : 'Follow',
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

  /// Commnet acitivity on Instagram, can be of two types.
  /// It could be mention by other user.
  /// Or they could like your comment.
  Widget _commnetActivityTIle({
    @required bool isMention,
    @required String comment,
    @required String otherUsername,
    @required String otherUserProfileImageUrl,
    @required String commentedOnMediaUrl,
  }) {
    return ListTile(
      isThreeLine: true,
      contentPadding: EdgeInsets.only(left: 10),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(otherUserProfileImageUrl),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: otherUsername,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: isMention
                  ? ' mentioned you in a comment:'
                  : ' liked your comment:',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: isMention ? ' @gyakhoe' : '',
              style: TextStyle(
                color: Colors.blue[100],
              ),
            ),
            TextSpan(
              text: comment,
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
        margin: EdgeInsets.only(right: 10),
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

  Widget _likedOnPost({
    @required List<String> likedUsernames,
    @required String postUrl,
    @required List<String> likedUserImageUrls,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 10),
      leading: likedUserImageUrls.length > 1
          ? Container(
              height: 50,
              width: 50,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage(likedUserImageUrls.elementAt(0)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage(likedUserImageUrls.elementAt(1)),
                    ),
                  ),
                ],
              ),
            )
          : CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(likedUserImageUrls.elementAt(0)),
            ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: _formattedLikedUserNames(likedUsernames),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' liked your post.',
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
      //* Need some gesture detection over here to convert follow to following
      trailing: Container(
        margin: EdgeInsets.only(right: 10),
        width: 45,
        height: 45,
        color: Colors.pink,
        child: Image(
          image: NetworkImage(postUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  String _formattedLikedUserNames(List<String> listOfUser) {
    if (listOfUser.length > 2) {
      return '${listOfUser.elementAt(0)}, ${listOfUser.elementAt(1)} and ${listOfUser.length - 2} others';
    }
    String usernames = '';
    for (String username in listOfUser) {
      usernames = usernames + username + " ,";
    }

    usernames = usernames.substring(0, usernames.length - 1);
    return usernames;
  }
}
