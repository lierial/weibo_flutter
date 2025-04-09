import 'package:flunote/Apis/PostApi.dart';
import 'package:flutter/material.dart';

import '../../Model/Post.dart';

class HomeViewModel extends ChangeNotifier {
  int count = 6;
  int currentPage = 0;
  List posts = [];

  Future initViewModel(int userId) async {
    var result = await PostApi().getFollowsPosts(currentPage);
    if (result != null && result["result"]) {
      posts.addAll(result["data"]);
    }
  }

  Post getPost(int index) {
    return Post.fromJson(posts[index]);
  }

  void alterCount(int value) {
    count = value;
    notifyListeners();
  }
}
