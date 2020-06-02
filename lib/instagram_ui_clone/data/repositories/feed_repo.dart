import 'dart:convert';

import 'package:flutter_example/instagram_ui_clone/data/models/post.dart';
import 'package:flutter_example/instagram_ui_clone/data/models/story.dart';
import 'package:flutter/services.dart' show rootBundle;

class FeedRepo {
  static Future<List<Story>> getFutureListOfStoryFromJson() async {
    final String storyJsonString =
        await rootBundle.loadString('assets/json/stories.json');
    final List<dynamic> storiesMap =
        jsonDecode(storyJsonString)['stories'] as List;
    final List<Story> listOfStory =
        storiesMap.map((story) => Story.fromMap(story)).toList();
    return listOfStory;
  }

  static Future<List<Post>> getFutureListOfPostFromJson() async {
    final String storyJsonString =
        await rootBundle.loadString('assets/json/posts.json');
    final List<dynamic> storiesMap =
        jsonDecode(storyJsonString)['posts'] as List;
    final List<Post> listOfPost =
        storiesMap.map((post) => Post.fromMap(post)).toList();
    return listOfPost;
  }
}
