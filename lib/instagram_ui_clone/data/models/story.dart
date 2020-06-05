import 'dart:convert';

import 'package:flutter/foundation.dart';

class Story {
  final String username;
  final String imageUrl;
  final bool isSeen;

  Story({
    @required this.username,
    @required this.imageUrl,
    @required this.isSeen,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'imageUrl': imageUrl,
      'isSeen': isSeen,
    };
  }

  static Story fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Story(
      username: map['username'],
      imageUrl: map['imageUrl'],
      isSeen: map['isSeen'],
    );
  }

  String toJson() => json.encode(toMap());

  static Story fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Story(username: $username, imageUrl: $imageUrl, isSeen: $isSeen)';
}
