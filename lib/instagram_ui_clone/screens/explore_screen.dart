import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/explore_app_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExploreAppBar(height: 108),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColorDark,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: Utils.listOfImageUrl.length,
          itemBuilder: (context, index) => Container(
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                Utils.listOfImageUrl.elementAt(index),
              ),
            ),
          ),
          staggeredTileBuilder: (index) =>
              StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
      ),
    );
  }
}
