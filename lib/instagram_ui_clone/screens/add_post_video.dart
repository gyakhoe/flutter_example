import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/add_post_app_bar.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/add_post_camera_button.dart';

class AddPostVideo extends StatelessWidget {
  const AddPostVideo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddPostAppBar(
        screenName: 'video',
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
                    image: NetworkImage(Utils.listOfImageUrl.elementAt(15)),
                    fit: BoxFit.cover,
                  ),
                  cameraOptions(),
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
}
