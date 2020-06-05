import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/add_post_app_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AddPostCamera extends StatelessWidget {
  const AddPostCamera({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddPostAppBar(
        screenName: 'camera',
        height: 45,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: 410,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image(
                    image: NetworkImage(Utils.listOfImageUrl.elementAt(10)),
                    fit: BoxFit.cover,
                  ),
                  _cameraOptions(),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 410 - 45 - 45,
              color: Theme.of(context).primaryColorDark,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cameraOptions() {
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
}
